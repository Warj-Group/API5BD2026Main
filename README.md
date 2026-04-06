<span id="warj-group"></span>
<img width="850" alt="WARJ-Group" src="public/warj/warj_banner2.png" />

## Indice

<p align="justify">
    <a href="README_ptbr.md">Portuguese BR Version</a> |
    <a href="#introduction">Introduction</a> |
    <a href="#partner_company">Partner Company: SIATT</a> |
    <a href="#challenge">Challenge</a> |
    <a href="#solution">Solution</a> |
    <a href="#product-backlog">Product Backlog</a> |
    <a href="#fr_nfr">Functional and Non-Functional Requirements</a> |
    <a href="#calendar">Sprint Schedule</a> |
    <a href="#sprint-summary">Sprint Summaries</a> |
    <a href="#project-structure">Project Structure</a> |
    <a href="#documentation">Documentation</a> |
    <a href="#team">About the Team</a> |
    <a href="#technologies">Technologies Used</a>
</p>

<span id="introduction"></span>

## Introduction

**WARJ Insights** is a project developed by team **WARJ**, composed of 5th-semester students from the **Database program at FATEC São José dos Campos**.

The initiative focuses on building a data analysis solution aimed at generating **insights from historical information**. The project organizes scattered data into a structured base, enabling the identification of patterns and trends and supporting objective, business-oriented decision-making.

→ <a href="#warj-group">Home</a>

<span id="partner_company"></span>

## Partner Company: SIATT

**[SIATT (Sistemas Integrados de Alto Teor Tecnológico)](https://www.siatt.com.br/a-empresa?lang=pt)** is a Brazilian company in the defense sector, specialized in the development of advanced systems with a focus on smart weaponry and embedded technologies.

Operating both nationally and internationally, the company works on the creation and integration of solutions for aerial, naval, and land applications, including guidance, navigation, communication, and control systems.

Among its main projects is the **MANSUP (National Anti-Ship Missile)**, a strategic initiative of the Brazilian Navy aimed at strengthening technological autonomy in the defense sector.

→ <a href="#warj-group">Home</a>

<span id="challenge"></span>

## Challenge

<a href="Desafio_5BD_SIATT.pdf" target="_blank">Project-related data</a>, materials, costs, and hours worked are distributed across different sources, lacking a unified view for analysis.

This fragmentation hinders the understanding of project performance over time, limits the generation of indicators, and makes decision-making more reliant on manual processes.

The challenge involves structuring this data within an analytical environment that allows for the consolidation of historical information, the identification of patterns, and provides clear answers to strategic questions regarding costs, resource consumption, and project evolution.

→ <a href="#warj-group">Home</a>

<span id="solution"></span>

## Solution

**WARJ Insights** proposes the construction of an analytical platform to centralize and structure data from various sources.

The solution organizes this information into an analysis-oriented model, enabling more efficient queries and the generation of dashboards focused on historical data, evolution, and data comparison.

This makes it possible to visualize indicators in a consolidated manner, identify trends, and support decision-making based on consistent data.

→ <a href="#warj-group">Home</a>

<span id="product-backlog"></span>

## Product Backlog

| Rank | Priority | Consolidated User Story | Story Points | Sprint | Requirements |
|---|---|---|---:|---:|---|
| 1 | 🔴 High | As a manager, I want to view consolidated cost and time indicators per project to quickly understand overall performance | 8 | 1 | FR01, FR02, FR03 |
| 2 | 🔴 High | As a manager, I want to analyze the evolution of hours and costs over time per project to track progress and expenses | 8 | 1 | FR04, FR09, NFR01 |
| 3 | 🔴 High | As a manager, I want to view the team's effort distribution per project (hours per employee) to understand resource allocation | 5 | 1 | FR08, FR09 |
| 4 | 🔴 High | As a manager, I want to view costs and material consumption per project to evaluate financial impact | 5 | 1 | FR05, FR06, FR07 |
| 5 | 🔴 High | As a manager, I want to view consolidated employee and project data (hours and allocation) to understand the distribution of work | 5 | 1 | FR08 |
| 6 | 🟡 Medium | As a manager, I want to analyze indicators and evolution by program, including costs, hours, and project volume, for a strategic view | 8 | 2 | FR03, FR07, FR10, FR14, FR15, NFR08 |
| 7 | 🟡 Medium | As a manager, I want to view project status, deviations, and progress to identify risks and areas needing attention | 8 | 2 | FR10, FR11 |
| 8 | 🔴 High | As a manager, I want to identify critical materials and forecast purchasing needs based on consumption to avoid delays | 8 | 3 | FR12 |
| 9 | 🟡 Medium | As a manager, I want to analyze material consumption over time to understand the use of physical resources | 5 | 3 | FR05, FR07 |
| 10 | 🟢 Low | As a manager, I want to export dashboard data and reports to share analyses with other departments | 3 | 3 | FR13, NFR09 |

→ <a href="#warj-group">Home</a>

<span id="fr_nfr"></span>

## Functional Requirements - FR

| ID | Description | Backlog |
|---|---|---|
| FR01 | Main dashboard structuring for data visualization | 1 |
| FR02 | Display of consolidated cost and performance indicators | 1 |
| FR03 | Application of filters by period, program, and project | 1, 6 |
| FR04 | Visualization of the historical evolution of costs and hours | 2 |
| FR05 | Analysis of materials and their financial impacts | 4, 9 |
| FR06 | Combined cost analysis between materials and hours worked | 4 |
| FR07 | Visualization of costs and material consumption per project and over time | 4, 6, 9 |
| FR08 | Visualization and analysis of team allocation and effort | 3, 5 |
| FR09 | Analysis of costs and hours per project and collaborator | 2, 3 |
| FR10 | Visualization of consolidated indicators and monitoring by program | 6, 7 |
| FR11 | Identification of deviations, risks, and areas needing attention in projects | 7 |
| FR12 | Import of external data to support analysis of critical materials and consumption | 8 |
| FR13 | Export of analytical data and reports | 10 |
| FR14 | Traceability and origin of the presented data | 6 |
| FR15 | Monitoring of data processing and consistency | 6 |

## Non-Functional Requirements - NFR

| ID | Description | Backlog |
|---|---|---|
| NFR01 | Data modeling focused on historical and structured analysis | 2 |
| NFR02 | Use of a relational database for information persistence | — |
| NFR03 | Backend prepared for data processing and business rules | — |
| NFR04 | Frontend interface focused on data visualization and interaction | — |
| NFR05 | Continuous integration pipeline for automated validation | — |
| NFR06 | Implementation of automated tests for greater reliability | — |
| NFR07 | Quality assurance through static code analysis | — |
| NFR08 | Reliability and traceability of analytical data | 6 |
| NFR09 | Preservation of the analytical context during exports | 10 |

Backlog = "-" indicates that the requirement is not directly associated with a specific user story but is fundamental for the overall project implementation.

→ <a href="#warj-group">Home</a>

<span id="calendar"></span>

## Sprint Schedule

| Sprint / Stage | Period | Status |
|---|---|---|
| Kick-off | 03/02 to 03/06 | ✅ Completed |
| Planning | 03/09 to 03/13 | ✅ Completed |
| Sprint 1 | 03/16 to 04/05 | 🔄 In Progress |
| Review / Planning | 04/06 to 04/10 | ⏳ Planned |
| Sprint 2 | 04/13 to 05/03 | ⏳ Future |
| Review / Planning | 05/04 to 05/08 | ⏳ Future |
| Sprint 3 | 05/11 to 05/31 | ⏳ Future |
| Final Review | 06/01 to 06/05 | ⏳ Future |
| Solutions Fair | 06/11 | 🎯 Final Milestone |

→ <a href="#warj-group">Home</a>

<span id="sprint-summary"></span>

## Sprint Summaries

<details>
<summary>🚀 Kick-off</summary>

### Initial Engineering Standards and Technologies

- PostgreSQL as the main database;
- Dimensional modeling (Data Warehouse);
- Python + FastAPI for backend and ETL;
- Nuxt + Vue.js for frontend;
- ETL strategy using a star model;
- CI/CD with GitHub Actions + static analysis + automated tests.

**Related requirements:** NFR01, NFR02, NFR03, NFR04, NFR05, NFR06, NFR07

</details>

---

<details>
<summary>⚙️ Sprint 1</summary>

**Period:** 03/16/2026 to 04/05/2026

**Sprint Objective:** Build the foundation of the analytical solution and provide the first dashboards for project data visualization.

**Met requirements:** FR01, FR02, FR03, FR04, FR08, FR09, NFR01

**Sprint Scope (Summary):**

- Dashboard base structure
- Consolidated indicators
- Filters by project/period
- Historical cost evolution
- Initial team and effort analysis

### Completed Deliveries

- _To be completed at the end of the sprint._

### Challenges and Obstacles

- _To be completed at the end of the sprint._

### Lessons Learned

- _To be completed at the end of the sprint._

### Wireframe

![Sprint 1 Wireframes](public/wireframes/sp1_wireframes.gif)

### Burndown

![Sprint 1 Burndown](public/burndown/sprint1.png)

### SonarCloud / Quality

![Sprint 1 SonarCloud](public/sonarcloud/sprint1.png)

### Evidence

- https://youtube.com/YOUR_SPRINT_1_VIDEO

</details>

---

<details>
<summary>⚙️ Sprint 2</summary>

**Period:** 04/13/2026 to 05/03/2026

**Sprint Objective:** Expand analytical capacity with a focus on costs, materials, and financial indicators.

**Met requirements:** FR05, FR06, FR07, FR10, FR11, FR14, FR15, NFR08

**Sprint Scope (Summary):**

- Material and cost analysis
- Financial indicators and budget
- Consolidation by program
- Data traceability
- Identification of deviations

### Completed Deliveries

- _To be completed at the end of the sprint._

### Challenges and Obstacles

- _To be completed at the end of the sprint._

### Lessons Learned

- _To be completed at the end of the sprint._

### Wireframe

![Sprint 2 Wireframes](public/wireframes/sp2_wireframes.gif)

### Burndown

![Sprint 2 Burndown](public/burndown/sprint2.png)

### SonarCloud / Quality

![Sprint 2 SonarCloud](public/sonarcloud/sprint2.png)

### Evidence

- https://youtube.com/YOUR_SPRINT_2_VIDEO

</details>

---

<details>
<summary>⚙️ Sprint 3</summary>

**Period:** 05/11/2026 to 05/31/2026

**Sprint Objective:** Finalize analytical features, data governance, exports, and system control.

**Met requirements:** FR12, FR13, NFR09

**Sprint Scope (Summary):**

- Data import (CSV)
- Report export
- Historical material consumption
- Final adjustments and stability

### Completed Deliveries

- _To be completed at the end of the sprint._

### Challenges and Obstacles

- _To be completed at the end of the sprint._

### Lessons Learned

- _To be completed at the end of the sprint._

### Wireframe

![Sprint 3 Wireframes](public/wireframes/sp3_wireframes.gif)

### Burndown

![Sprint 3 Burndown](public/burndown/sprint3.png)

### SonarCloud / Quality

![Sprint 3 SonarCloud](public/sonarcloud/sprint3.png)

### Evidence

- https://youtube.com/YOUR_SPRINT_3_VIDEO

</details>

<br>

→ <a href="#warj-group">Home</a>

<span id="team"></span>

## About the Team

<div align="center">

| Member | Role | Socials |
|---|---|---|
| <div align="center"><img src="https://github.com/williamantoniazzi.png" width="80" alt="William Antoniazzi"><br><b>William Antoniazzi</b></div> | Scrum Master / Developer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/williamantoniazzi) [![GitHub](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/williamantoniazzi) |
| <div align="center"><img src="https://github.com/allineramos.png" width="80" alt="Aline Ramos"><br><b>Aline Ramos</b></div> | Product Owner / Developer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/aline-ramos-3186b130/) [![GitHub](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/allineramos) |
| <div align="center"><img src="https://github.com/BispoJPM.png" width="80" alt="João Pedro"><br><b>João Pedro</b></div> | Developer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jo%C3%A3o-pedro-563369181/) [![GitHub](https://img.shields.io/badge/GitHub-111217?logo=github&logoColor=white)](https://github.com/BispoJPM) |

</div>

<br>

→ <a href="#warj-group">Home</a>

<span id="technologies"></span>

## Technologies Used

<img width="850" alt="WARJ-Group Technologies" src="public/warj/tecnologias_adotadas.png" />

→ <a href="#warj-group">Home</a>