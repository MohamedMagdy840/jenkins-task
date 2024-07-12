# jenkins-task
Jenkins task that build dockerfile from this repo and push it to private docker repo.  

## Integrating OWASP Dependency-Check, Trivy, SonarQube, and OpenJDK with Jenkins

### Summary

**OWASP (Open Web Application Security Project)**
- **Purpose:** Improve software security through tools, guidelines, and standards.
- **Common Tools and Projects:**
  - **OWASP Top Ten:** Top ten most critical web application security risks.
  - **OWASP ZAP (Zed Attack Proxy):** Web application security scanner.
  - **OWASP Dependency-Check:** Tool to identify project dependencies and check if there are any known, publicly disclosed, vulnerabilities.
- **Role in DevOps:** Integrate security practices into CI/CD pipelines to ensure applications are secure from common vulnerabilities.

**Trivy**
- **Purpose:** Vulnerability scanner for container images, file systems, and Git repositories.
- **Features:**
  - Scans for OS vulnerabilities and dependencies in container images.
  - Detects vulnerabilities in various programming languages and packages.
  - Integrates with CI/CD pipelines for continuous scanning.
- **Role in DevOps:** Identify and mitigate security risks in containerized applications by scanning container images before deployment.

**SonarQube**
- **Purpose:** Tool for continuous inspection of code quality through static code analysis.
- **Features:**
  - Supports multiple programming languages.
  - Provides detailed reports on code quality and technical debt.
  - Integrates with various CI/CD tools like Jenkins, GitLab, and GitHub.
- **Role in DevOps:** Maintain code quality and security by providing automated code reviews, enforcing coding standards, and ensuring the codebase remains clean and maintainable.

**OpenJDK**
- **Purpose:** Open-source implementation of the Java Platform, Standard Edition.
- **Role in DevOps:** Provide a Java runtime environment for building and running Java applications in Jenkins pipelines.

### Integration with Jenkins

**1. Integrating OWASP Dependency-Check with Jenkins**
1. **Install OWASP Dependency-Check:**
   - Download and install OWASP Dependency-Check from the [official website](https://jeremylong.github.io/DependencyCheck/).

2. **Create a Dependency-Check Script:**
   - Create a script to run Dependency-Check. For example:
     ```bash
     #!/bin/bash
     dependency-check --project your-project --scan /path/to/your/project --format HTML --out dependency-check-report.html
     ```

3. **Install Dependency-Check Jenkins Plugin:**
   - In Jenkins, navigate to `Manage Jenkins` -> `Manage Plugins` -> `Available`.
   - Search for `OWASP Dependency-Check` and install the plugin.

4. **Configure Jenkins Job:**
   - Create a new Jenkins job or configure an existing one.
   - In the `Build` section, add `Execute Shell` and paste the Dependency-Check script.

5. **Post-build Actions:**
   - Add `Publish HTML reports` and configure it to read the Dependency-Check report.


**2. Integrating Trivy with Jenkins**
1. **Install Trivy:**
   - Follow the installation instructions from the [official Trivy repository](https://github.com/aquasecurity/trivy).

2. **Create Trivy Scan Script:**
   - Create a script to run Trivy scans. For example:
     ```bash
     #!/bin/bash
     trivy image --severity HIGH,CRITICAL your-image-name
     ```

3. **Configure Jenkins Job:**
   - Create a new Jenkins job or configure an existing one.
   - In the `Build` section, add `Execute Shell` and paste the Trivy scan script.

4. **Post-build Actions:**
   - Add `Publish JUnit test result report` and configure it to read the Trivy scan results if using XML output.

**3. Integrating SonarQube with Jenkins**
1. **Install SonarQube:**
   - Follow the installation instructions from the [official SonarQube website](https://www.sonarqube.org/downloads/).

2. **Install SonarQube Scanner:**
   - Download and install the SonarQube Scanner from the [official website](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/).

3. **Install SonarQube Jenkins Plugin:**
   - In Jenkins, navigate to `Manage Jenkins` -> `Manage Plugins` -> `Available`.
   - Search for `SonarQube Scanner` and install the plugin.

4. **Configure SonarQube in Jenkins:**
   - Navigate to `Manage Jenkins` -> `Configure System`.
   - Scroll to `SonarQube Servers` and add a new SonarQube server with your SonarQube instance details.

5. **Configure Jenkins Job:**
   - Create a new Jenkins job or configure an existing one.
   - In the `Build` section, add `Execute SonarQube Scanner`.
   - Provide the necessary project properties, for example:
     ```bash
     sonar.projectKey=myproject
     sonar.sources=.
     sonar.host.url=http://your-sonarqube-server
     sonar.login=yourtoken
     ```

**4. Integrating OpenJDK with Jenkins**
1. **Install OpenJDK:**
   - Follow the installation instructions for your operating system. For example, on Ubuntu:
     ```bash
     sudo apt update
     sudo apt install openjdk-11-jdk
     ```

2. **Install JDK Tool Plugin in Jenkins:**
   - In Jenkins, navigate to `Manage Jenkins` -> `Manage Plugins` -> `Available`.
   - Search for `JDK Tool Plugin` and install the plugin.

3. **Configure JDK in Jenkins:**
   - Navigate to `Manage Jenkins` -> `Global Tool Configuration`.
   - Scroll to `JDK installations` and add a new JDK installation.
   - Provide a name for the JDK (e.g., `OpenJDK11`) and the path to the JDK installation directory (e.g., `/usr/lib/jvm/java-11-openjdk-amd64`).

4. **Configure Jenkins Job:**
   - Create a new Jenkins job or configure an existing one.
   - In the `Build Environment` section, check `Install JDK` and select the JDK installation you configured.

**Note:**
- Ensure Jenkins has access to the necessary tools and servers (OWASP Dependency-Check, Trivy, SonarQube, OpenJDK).
- Customize the integration steps based on your specific project requirements and environment settings.



