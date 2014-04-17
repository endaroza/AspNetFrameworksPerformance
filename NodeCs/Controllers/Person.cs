using System;

namespace NodeCS.Controllers
{
    public class Person
    {
        public Person()
        {
            Id = 10;
            Name = "Rick";
            Entered = DateTime.UtcNow;
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime Entered { get; set; }
    }
}
