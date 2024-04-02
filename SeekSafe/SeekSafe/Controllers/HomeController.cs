﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeekSafe.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Home
        public ActionResult Index()
        {
            // or var userList = _userRepo.GetAll();
            List<UserAccounts> userList = _userRepo.GetAll();
            return View(userList);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(UserAccounts u)
        {
            _userRepo.Create(u);
            TempData["Msg"] = $"User {u.username} is Added Successfully!";
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            return View(_userRepo.Get(id));
        }

        public ActionResult Edit(int id)
        {
            return View(_userRepo.Get(id));
        }
        [HttpPost]
        public ActionResult Edit(UserAccounts u)
        {
            _userRepo.Update(u.userID, u);
            TempData["Msg"] = $"User {u.username} is Updated Successfully!";
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            _userRepo.Delete(id);
            TempData["Msg"] = $"User Deleted Successfully!";
            return RedirectToAction("Index");
        }
    }
}