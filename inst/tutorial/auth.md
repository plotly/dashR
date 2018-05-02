# Authentication

Authentication for dash apps is provided through a separate
[`dash-auth`](https://github.com/plotly/dash-auth) package.

`dash-auth` provides two methods of authentication:
**HTTP Basic Auth** and **Plotly OAuth**.

HTTP Basic Auth is one of the simplest forms of authentication on the web.
As a Dash developer, you hardcode a set of usernames and passwords in your
code and send those usernames and passwords to your viewers.
There are a few limitations to HTTP Basic Auth:
- Users can not log out of applications
- You are responsible for sending the usernames and passwords
to your viewers over a secure channel
- Your viewers can not create their own account and cannot change their
password
- You are responsible for safely storing the username and password pairs in
your code.

Plotly OAuth provides authentication through your online Plotly account
or through your company's [Plotly On-Premise server](https://plot.ly/products/on-premise).
As a Dash developer, this requires a paid Plotly subscription.
Here's where you can [subscribe to Plotly Cloud](https://plot.ly/products/cloud),
and here's where you can
[contact us about Plotly On-Premise](https://plotly.typeform.com/to/seG7Vb).
The viewers of your app will need a Plotly account but they do not need to
upgrade to a paid subscription.

Plotly OAuth allows you to share your apps with other users who have Plotly
accounts. With Plotly On-Premise, this includes sharing apps through
the integrated LDAP system. Apps that you have saved will appear in your
list of files at [https://plot.ly/organize](https://plot.ly/organize)
and you can manage the permissions of the apps there. Viewers create and
manage their own accounts.

## Basic Auth Example

Logging in through Basic Auth looks like this:
