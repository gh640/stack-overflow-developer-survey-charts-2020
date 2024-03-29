# Stack Overflow Developer Survey Charts 2020

This repository is made for visualizing the Stack Overflow Developer Survey 2020 results. Currently stats only for Python and Rust are visualized.

## Charts

You can see generated charts for Python related stats in the following pages.

- [plot_so_developer_survey_python.ipynb](https://github.com/gh640/stack-overflow-developer-survey-charts-2020/blob/main/plot_so_developer_survey_python.ipynb)
- [charts-python.md](https://github.com/gh640/stack-overflow-developer-survey-charts-2020/blob/main/charts-python.md)
- [charts-rust.md](https://github.com/gh640/stack-overflow-developer-survey-charts-2020/blob/main/charts-rust.md)

## Prerequisites

- Docker
- Docker Compose

## Usage

If you want to run the notebook in your environment, follow the steps below.

1. Clone this repo.
2. Build Docker image.
3. Download the survey data.
4. Run Jupyter notebook.
5. Stop Jupyter notebook.

### 1. Clone this repo.

Clone this repository.

```bash
$ git clone https://github.com/gh640/stack-overflow-developer-survey-charts-2020
```

### 2. Build Docker image.

```bash
docker compose build
```

### 3. Download the survey data.

Download the csv file which contains the survey results by clicking `Download Full Data Set (CSV)` in `2020` section in the following page.

- [Stack Overflow Insights - Developer Hiring, Marketing, and User Research](https://insights.stackoverflow.com/survey)

Then, extract the zip file and put the csv file named `survey_results_public.csv` under `data/` directory.

```bash
TMP_ZIP="/tmp/2020.zip"
ZIP_URL="https://info.stackoverflowsolutions.com/rs/719-EMH-566/images/stack-overflow-developer-survey-2020.zip"

http -d --output="${TMP_ZIP}" "${ZIP_URL}"
unzip "${TMP_ZIP}" -d /tmp/
mv /tmp/survey_results_public.csv ./data/
```

### 4. Run Jupyter notebook.

Now you've finished to prepare the environment and run the command below to see the Jupyter notebook. It can be done with Docker easily.

```bash
docker-compose up -d
docker-compose logs -f
```

Open the URL in the log stream with your browser. Then click `plot_so_developer_survey_python.ipynb` in the list.

### 5. Stop Jupyter notebook.

After using the notebook, Stop Jupyter notebook.

```bash
docker-compose down
```

Delete the Docker image after you've finished using the image.

## References

- [Stack Overflow Insights - Developer Hiring, Marketing, and User Research](https://insights.stackoverflow.com/survey)
- [Stack Overflow Developer Survey 2020](https://insights.stackoverflow.com/survey/2020)

## License

Licensed under MIT license.
