import 'package:flutter/material.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "How Kazi Connect Works",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/how_it_works.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const ListTile(
            subtitle: Text(
                "Welcome to Kazi Connect, where finding your hustle is just a few clicks away! "
                "We've designed our platform to make the job search process easy, efficient, "
                "and tailored to your preferences. Here's how Kazi Connect works"),
          ),
          const ListTile(
            title: Text("Explore Job Categories"),
            subtitle: Text(
                "Begin by exploring a wide range of job categories tailored to your "
                "interests and skills. Whether you're looking for full-time positions, "
                "part-time gigs, attachments, internships, or short-term projects, we've got you covered."),
          ),
          const ListTile(
            title: Text("View Job Listings"),
            subtitle: Text(
                "Browse through detailed job listings that include all the essential "
                "information you need to make an informed decision. You'll find job "
                "descriptions, requirements, company details, and more."),
          ),
          const ListTile(
            title: Text("Save Jobs"),
            subtitle: Text(
                "Found a job that caught your eye? Save it to your favorites "
                "list for easy access later."),
          ),
          const ListTile(
            title: Text("Apply with Ease"),
            subtitle: Text(
                "When you're ready to apply, we've streamlined the process. "
                "Submit your application directly through the app, and keep track of "
                "your applications in one convenient place."),
          ),
          const ListTile(
            title: Text("Connect with Employers"),
            subtitle: Text(
                "Experience the power of seamless communication. Chat directly "
                "with employers, ask questions, and showcase your skills "
                "to stand out from the crowd."),
          ),
          const ListTile(
            title: Text("Stay Informed"),
            subtitle: Text(
                "Stay up-to-date with the latest job market trends, industry insights, "
                "and tips for acing interviews through our regularly updated resources."),
          ),
          const ListTile(
            title: Text("User-Friendly Experience"),
            subtitle: Text(
                "We've designed Kazi Connect to be user-friendly and intuitive. "
                "No more struggling through complicated interfaces – our platform puts the "
                "focus on what matters most: connecting you with your ideal job."),
          )
        ],
      ),
    );
  }
}
