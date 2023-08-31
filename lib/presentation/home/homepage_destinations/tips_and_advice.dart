import 'package:flutter/material.dart';

class TipsAndAdvice extends StatelessWidget {
  const TipsAndAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Job Search Tips and Advice",
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
                "assets/tips_and_advice.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const ListTile(
            title: Text("Stay Persistent"),
            subtitle: Text(
                "Job hunting can be challenging, but persistence pays off. Stay proactive, "
                "apply to relevant positions regularly, and don't get discouraged by rejections."),
          ),
          const ListTile(
            title: Text("Build Your Online Presence"),
            subtitle: Text(
                "Maintain a professional online presence. Ensure your LinkedIn "
                "profile is up-to-date and reflects your skills and experiences accurately."),
          ),
          const ListTile(
            title: Text("Network Effectively"),
            subtitle: Text(
                "Networking can open doors to hidden job opportunities. Attend "
                "industry events, connect with professionals on LinkedIn, and "
                "consider informational interviews."),
          ),
          const ListTile(
            title: Text("Continuous Learning"),
            subtitle: Text(
                "Stay updated on industry trends and enhance your skills through "
                "online courses, workshops, and certifications. Lifelong learning "
                "demonstrates your dedication to personal and professional growth."),
          ),
          const ListTile(
            subtitle: Text(
                "We're here to empower you with valuable insights and advice that "
                "will enhance your job search experience. Our goal is to help "
                "you stand out, succeed in interviews, and land your dream job. "
                "Here are some essential tips to keep in mind:"),
          ),
          const ListTile(
            title: Text("Craft an Impressive Resume"),
            subtitle: Text(
                "Your resume is your first impression on potential employers. "
                "Tailor it to showcase your relevant skills, experience, and achievements. "
                "Use clear formatting and bullet points for easy readability."),
          ),
          const ListTile(
            title: Text("Write a Compelling Cover Letter"),
            subtitle: Text(
                "A well-written cover letter can set you apart from other applicants. "
                "Address the hiring manager by name, highlight your skills that match the job "
                "requirements, and explain why you're a great fit for the role."),
          ),
          const ListTile(
            title: Text("Research the Company"),
            subtitle: Text(
                "Before an interview, research the company thoroughly. Understand their mission, "
                "values, products, and recent news. This knowledge will impress the interviewer "
                "and show your genuine interest."),
          ),
          const ListTile(
            title: Text("Practice Interview Questions"),
            subtitle: Text(
                "Prepare for interviews by practicing common interview questions. Craft concise, "
                "engaging responses that highlight your skills and experiences. Use the STAR method "
                "(Situation, Task, Action, Result) for behavioral questions."),
          ),
          const ListTile(
            title: Text("Dress Appropriately"),
            subtitle: Text(
                "Dress professionally and appropriately for the industry you're interviewing in. "
                "When in doubt, it's better to be slightly overdressed than underdressed."),
          ),
          const ListTile(
            title: Text("Showcase Soft Skills"),
            subtitle: Text(
                "In addition to technical skills, employers value soft skills such as communication, "
                "teamwork, and problem-solving. Use examples from your experiences to demonstrate these qualities."),
          ),
          const ListTile(
            title: Text("Ask Thoughtful Questions"),
            subtitle: Text(
                "Prepare questions to ask the interviewer. This demonstrates your interest in the company and role. "
                "Inquire about company culture, team dynamics, and growth opportunities."),
          ),
          const ListTile(
            title: Text("Follow Up"),
            subtitle: Text(
                "Send a thank-you email after an interview. Express your gratitude for the opportunity "
                "and reaffirm your interest in the position. This gesture can leave a positive impression."),
          ),
          const ListTile(
            title: Text("Remember, Your Journey is Unique"),
            subtitle: Text(
                "Every job search journey is unique. Tailor these tips to your individual strengths "
                "and circumstances. Stay positive, be adaptable, and remember that each step you take "
                "brings you closer to your desired career path. Good luck on your job search adventure!**"),
          )
        ],
      ),
    );
  }
}
