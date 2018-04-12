library(dashR)

source("styles.R")

STEPS <- c(
  'Part 1 - Authenticating to Plotly On-Premise with SSH' = 'ssh',
  'Part 2 - Initializing App on Plotly On-Premise' = 'create_app',
  'Part 3 - Deploying App to Plotly On-Premise' = 'deployment',
  'Part 4 - Adding Authentication to your Dash App (Optional)' = 'auth'
)

instructions <- function(chapter, platform) {
  is_windows <- platform == "windows"
  is_mac <- platform == "mac"

  switch(
    chapter,
    ssh = list(
      coreMarkdown("You will deploy your Dash code to Plotly On-Premise using Git with SSH."),
      if (is_windows) coreMarkdown("These instructions assume that you are using **Git Bash** on Windows, which is included in the official [Git for Windows release](https://git-scm.com/download/win)."),
      htmlHr(),
      coreMarkdown(
        "### Generate a new SSH key",
        "If you already have an SSH key that you've used in other services,",
        "you can use that key instead of generating a new one."
      ),
      coreMarkdown(if (is_windows) '**1. Open Git Bash**' else '**1. Open Terminal**'),

      coreMarkdown(
        "**2. Generate Key**",
        "",
        "This command will walk you through a few instructions."
      ),

      coreSyntaxHighlighter(
        '$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"',
        customStyle = styles$code_container,
        language = 'bash'
      ),

      htmlHr(),

      coreMarkdown(
        "### Add your SSH key to the ssh-agent",
        "**1. Ensure the ssh-agent is running:**"
      ),

      coreSyntaxHighlighter(
        if (is_windows) '$ eval $(ssh-agent -s)' else '$ eval "$(ssh-agent -s)"',
        customStyle = styles$code_container,
        language = 'bash'
      ),

      coreMarkdown(
        "**2. Run `ssh-add`**",
        "Replace `id_rsa` with the name of the key that you created above if it is different."
      ),

      coreSyntaxHighlighter(
        if (is_windows) '$ ssh-add ~/.ssh/id_rsa' else '$ ssh-add -K ~/.ssh/id_rsa',
        customStyle = styles$code_container,
        language = 'bash'
      ),
      htmlHr(),

      htmlH3("Add your SSH public key your Dash App Manager"),

      coreMarkdown(
        "**1. Copy the SSH key to your clipboard.**",
        "",
        "Replace `id_rsa.pub` with the name of the key that you created above if it is different."
      ),

      coreSyntaxHighlighter(
        if (is_windows) '$ clip < ~/.ssh/id_rsa.pub' else if (is_mac) '$ pbcopy < ~/.ssh/id_rsa.pub' else '$ sudo apt-get install xclip\n$ xclip -sel clip < ~/.ssh/id_rsa.pub',
        customStyle = styles$code_container,
        language = 'bash'
      ),

      coreMarkdown(
        "**2. Open the Dash App Manager**",
        "",
        "You can find the Dash App Manager by clicking on 'Dash App' in your
Plotly On-Premise's 'Create' menu.",
        "",
        "> *The Dash App item in the Create menu takes you to the Dash App Manager*"
      ),

      htmlImg(
        alt = 'Dash App Create Menu',
        src = 'https://github.com/plotly/dash-docs/raw/master/images/dash-create-menu.png',
        style = list(
          width = '100%',
          border = 'thin lightgrey solid',
          `border-radius` = '4px'
        )
      ),

      coreMarkdown(
        "**3. Paste your key into the Dash App Manager's SSH key field.**",
        "",
        "> *The Dash App Manager's SSH Key Interface. Copy and paste",
        "> your public key in this interface and click 'Update'.*"
      ),

      htmlImg(
        alt = 'Dash App Manager Public Key Interface',
        src = 'https://github.com/plotly/dash-docs/raw/master/images/dash-app-manager-ssh-key.png',
        style = list(
          width = '100%',
          border = 'thin lightgrey solid',
          `border-radius` = '4px'
        )
      ),

      htmlHr(),

      htmlH3("Modify SSH Config"),

      coreMarkdown(
        "Next, specify a custom port in your SSH config. By default, this should be",
        "`3022` but your server administrator may have set it to something different.",

        "This file is located in `~/.ssh/config`. If it's not there, then create it.",
        "Add the following lines to this file, replacing `your-dash-app-manager` with the domain of",
        "your Dash App Manager (without `http://` or `https://`)."
      ),

      coreSyntaxHighlighter(
        "Host your-dash-app-manager\n\tPort 3022",
        customStyle = styles$code_container
      ),

      if (is_mac) {
        coreMarkdown(
          "If you're having trouble opening this file, you can run `$ open ~/.ssh/config`",
          "which will open the file using your default editor. If the file doesn't exist,",
          "then you can open that hidden folder with just `$ open ~/.ssh`"
        )
      },

      htmlHr(),

      coreMarkdown("Next, proceed to Part 2 to intialize your app on Plotly On-Premise.")
    ),
    create_app = list(
      coreMarkdown(
        "**1. Visit the Dash App Manager**",
        "",
        "**2. Add an app**",
        "",
        "Click on `Add an app` and enter a name for your app.",
        "The app's name will be part of the URL of your app."
      ),
      htmlImg(
        alt = 'Dash App Manager Add App Interface',
        src = 'https://github.com/plotly/dash-docs/raw/master/images/dash-app-manager-empty.png',
        style = list(
          width = '100%',
          border = 'thin lightgrey solid',
          `border-radius` = '4px'
        )
      ),
      htmlHr(),
      coreMarkdown("Next, proceed to Part 3 to deploy your app")
    ),

    deployment = list(
      htmlH4("Download the Sample App from GitHub"),
      coreMarkdown("Clone the [DashR On Premise Sample App](https://github.com/plotly/dashR-on-premise-sample-app) from GitHub."),
      if (is_windows) coreMarkdown('In Git Bash, run: '),
      coreSyntaxHighlighter(
        "$ git clone https://github.com/plotly/dashR-on-premise-sample-app.git",
        customStyle = styles$code_container
      ),
      htmlHr(),
      coreMarkdown("
#### Configure your Plotly On-Premise server to be your Git remote

The following command will create a remote host to your new app on Plotly On-Premise.
"),
      coreSyntaxHighlighter(
        "$ cd dashR-on-premise-sample-app\n$ git remote add plotly dokku@your-dash-app-manager:your-dash-app-name",
        customStyle = styles$code_container,
        language = 'r'
      ),
      coreMarkdown(
        "Replace `your-dash-app-name` with the name of your Dash app that you supplied",
        "in the Dash app manager and `your-dash-app-manager` with the domain of the",
        "Dash App Manager.",
        "",
        "For example, if your dashR app name was `my-first-dash-app`",
        "and the domain of your organizations DashR App Manager was `dashR.acme-corporation.com`,",
        "then this command would be",
        "`git remote add plotly dokku@dashR.acme-corporation.com:my-first-dash-app`."
      ),
      htmlHr(),

      htmlH4("Modify config"),

      coreMarkdown(
        "Read through `config.R` and modify the values as necessary.",
        "If Dash On-Premise was set up with 'path-based routing'",
        "(the default), then you will just need to change the",
        "`DASH_APP_NAME` to be equal to the name of the Dash app that you",
        "set earlier."
      ),

      htmlHr(),
      htmlH4("Deploying Changes"),

      coreMarkdown(
        "After you have modified `config.R`, you are ready to upload",
        "this folder to your DashR On-Premise server.",
        "Files are transferred to the server using `git`:"
      ),

      coreSyntaxHighlighter(
        "$ git status # view the changed files",
        "$ git diff # view the actual changed lines of code",
        "$ git add .  # add all the changes",
        "$ git commit -m 'a description of the changes'",
        "$ git push plotly master",
        customStyle = styles$code_container,
        language = 'r'
      ),

      coreMarkdown(
        "This commands will push the code in this folder to the",
        "DashR On-Premise server and while doing so, will install the",
        "necessary R packages and run your application automatically.",
        "",
        "Whenever you make changes to your DashR code,",
        "you will need to run those `git` commands above.",
        "",
        "If you install any other R packages, do so in",
        "the `init.R` file. Packages that are included in this",
        "file will be installed automatically by the Plotly On-Premise",
        "server.",
        "",
        "You can now modify `app.R` with your own custom DashR",
        "application code."
      )
    ),

    auth = list(
      coreMarkdown(
        "The `dash-auth` package provides login through your Plotly",
        "On-Premise accounts.",
        "",
        "#### Modify the `config.R` file",
        "",
        "This file contains several settings that are used in your app.",
        "It's kept in a separate file so that it's easy for you to",
        "transfer from app to app.",
        "*Read through this file and modify the variables as appropriate.*"
      ),

      coreMarkdown(
        "#### Redeploy your app",
        "",
        "Your app should now have a Plotly On-Premise login screen.",
        "You can manage the permissions of the app in your list of files",
        "at `https://<your-plotly-domain>/organize`."
      )
    )
  )
}




app <- Dash$new()

app$layout_set(
  htmlH1("Deploying DashR Apps on Plotly On-Premise"),

  coreMarkdown(
    "By default, DashR apps run on `localhost` - you can only access them on your",
    "own machine. With Plotly On-Premise, you can easily deploy your application",
    "to your organization's behind-the-firewall server.",
    "If you would like to learn more about Plotly On-Premise or start a trial,",
    "[please reach out](https://plotly.typeform.com/to/seG7Vb)."
  ),

  htmlHr(),

  coreRadioItems(
    id = 'step',
    options = STEPS,
    value = 'ssh'
  ),

  htmlHr(),

  htmlH2(id = 'header'),

  coreRadioItems(
    id = 'platform',
    options = c('Windows' = 'windows', 'Mac' = 'mac', 'Linux' = 'linux'),
    value = 'windows',
    labelStyle = list(display = 'inline-block')
  ),

  htmlHr(),

  htmlDiv(id = 'deployment-instructions')
)

app$callback(
  function(step = input("step")) names(STEPS)[STEPS %in% step],
  output("header")
)

app$callback(
  function(chapter = input("step"), platform = input("platform")) {
    instructions(chapter, platform)
  }, output("deployment-instructions")
)

app
