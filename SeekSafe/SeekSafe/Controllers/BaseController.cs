using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SeekSafe.Repository;

namespace SeekSafe.Controllers
{
    public class BaseController : Controller
    {
        public seekEntities _db;
        public BaseRepository<UserAccounts> _userRepo;

        public BaseController()
        {
            _db = new seekEntities();
            _userRepo = new BaseRepository<UserAccounts>();
        }
    }
}