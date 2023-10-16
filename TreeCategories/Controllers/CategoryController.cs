using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TreeCategories.Data;

namespace TreeCategories.Controllers
{
    [Route("api/categories")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly CategoryContext _context;

        public CategoryController(CategoryContext context)
        {
            _context = context;
        }

        // GET: api/categories
        [HttpGet]
        public ActionResult<IEnumerable<Category>> GetCategories()
        {
            return _context.Categories.ToList().Where(c=> c.IsRoot).ToList();
        }
    }
}