using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibraryBusinessLogicLayer;
using LibraryCommon;
using LibraryWebSite.Models;
using static LibraryBusinessLogicLayer.Context;

namespace LibraryWebSite.Controllers
{
    public class HomeController : Controller
    {
        [MustBeLoggedIn]
        public ActionResult HashAccount()
        {
            try
            {
                if (Authentication.isHashed())
                {
                    return View("Index", new Message("You are already Hashed"));
                }
                using (Context ctx = new Context())
                {

                    var user = Authentication.GetCurrentUser(ctx);
                    var rv = ctx.HashClearTextPassword(user.BorrowerName);
                    if (rv != RegisterUserCode.Success)
                    {
                        throw new Exception($"HashClearTextpassword returned {rv}");
                    }
                    else
                    {
                        string auth = User.Identity.AuthenticationType;

                        string[] data = auth.Split('|');
                        Session["AUTHMethod"] = $"Hashed|{data[1]}|{data[2]}|{data[3]}|{data[4]}";

                    }

                    return RedirectToAction("Index");

                }
            }
            catch(Exception ex)
            {
                return View("Exception", ex);
            }
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ForgotU()
        {
            System.Threading.Thread.Sleep(2000);
            // slow down processing to mitigate against email harvesting
            // humans will not notice the 2 second delay
            // but robots trying to harvest 1000s of email addresses will
            // be slowed down.
            return View();
        }

        [HttpPost]
        public ActionResult ForgotU(string EMail)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = ctx.BorrowerSecuredFindByEMail(EMail);
                    if (data == null)
                    {
                        TempData["Message"] = "If we Found your EMail Address, a message was sent.";
                    }
                    else
                    {
                        TempData["Message"] = "If we Found your EMail Address, a message was sent!";
                    }
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        public ActionResult ForgotP()
        {
            System.Threading.Thread.Sleep(2000);
            // slow down processing to mitigate against username harvesting
            // humans will not notice the 2 second delay
            // but robots trying to harvest 1000s of usernames will
            // be slowed down.
            return View();
        }

        [HttpPost]
        public ActionResult ForgotP(string EMail)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = ctx.BorrowerSecuredFindByName(EMail);
                    if (data == null)
                    {
                        TempData["Message"] = "If we Found your username, a message was sent to the EMail address on file.";
                    }
                    else
                    {
                        TempData["Message"] = "If we Found your username, a message was sent to the EMail address on file!";
                    }
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        public ActionResult Logout()
        {
            Session.Remove("AUTHUser");
            Session.Remove("AUTHRole");
            Session.Remove("AUTHMethod");
            return RedirectToAction("Index");
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Models.LoginViewModel vm)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }
                using (LibraryBusinessLogicLayer.Context context = new Context())
                {
                    string mechanism = "None";
                    Borrower b = context.ValidateUserClearText(vm.UserName, vm.Password);
                    if (b != null)
                    {
                        mechanism = "ClearText";
                    }
                    else
                    {
                        b = context.ValidateUserHashed(vm.UserName, vm.Password);
                        if (b != null)
                        {
                            mechanism = "Hashed";
                        }
                    }

                    if (b == null)
                    {
                        TempData["Message"] = "Invalid Username or Password";
                        ModelState.Clear();
                        return View(vm);
                    }
                    Session["AUTHUser"] = b.BorrowerName;
                    Session["AUTHRole"] = context.GetRoleString(b);
                    Session["AUTHMethod"] = $"{mechanism}|{b.BorrowerID}|{b.BorrowerName}|{b.BorrowerEMail}|{b.RoleName}";


                    // login can be called by the user OR by a system redirect
                    // if the user tries to access a restricted page
                    // if the user is redirected to login, then we want to
                    // send them back to the original page when they have
                    // successfully logged in
                    // we can tell if this is the case by looking for the 
                    // redirect that we put in the variable "ReturnURL"

                    string ReturnURL = TempData["ReturnURL"] as string;
                    if (string.IsNullOrEmpty(ReturnURL))
                    {
                        // the user came directly to login without a redirect
                        return RedirectToRoute(new { Controller = "Home", Action = "Index" });
                    }
                    else
                    {
                        // the user was redirected to login
                        return Redirect(ReturnURL);
                    }
                }


            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

            public ActionResult Register()
        {
            return View();
            
        }

        [HttpPost]

        public ActionResult Register(Models.RegistrationViewModel vm)
        {
            try
            {
               if (!ModelState.IsValid)
                {
                    return View();
                }
               using (LibraryBusinessLogicLayer.Context context = new Context())
                {
                   var rv =  context.RegisterUser(vm.UserName, vm.EMail, vm.DOB, vm.Password);
                    switch(rv)
                    {
                        case (RegisterUserCode.EMailExists):
                            TempData["Message"] =
                                "The EMail is already Registered";
                            return View(vm);
                        case (RegisterUserCode.UserNameExists):
                            TempData["Message"] =
                                "The Username is already registered";
                            return View(vm);
                        case (RegisterUserCode.Success):

                            return RedirectToRoute(new {Controller="Home", Action="Index" });
                        default:
                            TempData["Message"] =
                                "Unable to Validate Registration Data";
                            return View(vm);

                    }
                }
                    
                


            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}