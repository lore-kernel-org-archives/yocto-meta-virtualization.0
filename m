Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.60740.1595870323806145883
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 10:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ljy7g64c;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id a1so12675825edt.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2020 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WnQFSs9A66jDErdNX1ShOwTPUmYKFAR2ucWWo8hFNhQ=;
        b=Ljy7g64cwpQvm4KKEoyye91FBMzlAgkHDTcWSfAOPRSMaf8NIQKfx4SPY7IRRXlNue
         B8QAcfLL3nqdnQfdGHESSKLIKZP8V198x6z6CZHG0LUduwbZMxHUKd9IpJjkVXf1gY+M
         y/7vYO16EyZHiHeyY2QA8j70rF94Hynala1qSeaGpoiLNV6xlnhR0lzxyFoMZRyjdBdi
         VV5+yyCw7/3QIC15NbDn7gHvzqweXE/lyLJxJ1hO/gH1CjVAq6tI3Mk9HF6b0WfrBlgz
         1g2nraIVrjA8mU3JObCe+VRKk+tUkwJ/ZJRy56OqvK1WcZ+CzBJwBjh0uRrD/cCllyps
         UBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WnQFSs9A66jDErdNX1ShOwTPUmYKFAR2ucWWo8hFNhQ=;
        b=rLve0Hdx5dZHovNdLlz0GDCaLML0crWTv4f5oBrbjj9psIcf3LhJ5u6Vxo7PjD04Eb
         1obJnV4jUqzaJ7Q7vn4VbkuNcNQPYFm8M2ehz1pHCS4Qwku0jvPnlDv7xfPHvO6HYv7e
         v/bIuWFvUyJChuQJy+Xmj5Lltgcr2nPerVqLAfOx6+mxpAeRJ4Ji4mXKOFrfHVXUL5np
         s3jMe/0Bx+ySfR7uFLgPON9/siFEHy8RijQ8qHHZ+ECZQ7zaPMoozehDCZQKObha72pb
         UmJJv3tgObgzTdzWJBfE//DLAH+SQkYr1EFcvLrOHxUN7FmwBA5fMGOsbd8Mr8abbcBW
         z/KQ==
X-Gm-Message-State: AOAM532ls9onj97rzk5imP2CiNPDrQTEb3RGSbJyzfTmiu6DWtUgY+kz
	2+0a3yZ+xQvruTzrnkqV3qZbtmzjHd4KwaYuGp4=
X-Google-Smtp-Source: ABdhPJyg6yCy0T7N/gumMTwjSaRFCCDs9mQyZXuRmXATsdOefIgveE4WGpjy/8ZBZSgofgVqmsm9DKU6FMuiMMcY8wQ=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr21424533edb.352.1595870322233;
 Mon, 27 Jul 2020 10:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200727171316.103263-1-sakib.sajal@windriver.com>
In-Reply-To: <20200727171316.103263-1-sakib.sajal@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 27 Jul 2020 13:18:31 -0400
Message-ID: <CADkTA4NvxxMBgnSM883fkAHoNtQt-88TYaq3uy0eA3=izmeSYQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kubernetes: fix CVE-2020-8559
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000aa170405ab6f837c"

--000000000000aa170405ab6f837c
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 27, 2020 at 1:14 PM <sakib.sajal@windriver.com> wrote:

> Backported fix to resolve CVE-2020-8559.
>

This is on the release 1.18 branch, it makes no sense to do a backport of
an individual patch.

We will refresh k8s again shortly, so it will be picked up by that.

Bruce



>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...turn-proxied-redirects-to-the-client.patch | 149 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644
> recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
>
> diff --git
> a/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
> b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
> new file mode 100644
> index 0000000..c4552cd
> --- /dev/null
> +++
> b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
> @@ -0,0 +1,149 @@
> +From 469c439ea18cb6cc58e36357b9ead15d68122341 Mon Sep 17 00:00:00 2001
> +From: Tim Allclair <tallclair@google.com>
> +Date: Wed, 17 Jun 2020 11:09:02 -0700
> +Subject: [PATCH] Don't return proxied redirects to the client
> +
> +Upstream-Status: Backport [469c439ea18cb6cc58e36357b9ead15d68122341]
> +CVE: CVE-2020-8559
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +
> +---
> + .../k8s.io/apimachinery/pkg/util/net/http.go  |  2 +-
> + .../apimachinery/pkg/util/net/http_test.go    | 12 ++---
> + .../pkg/util/proxy/upgradeaware.go            | 10 ++++
> + .../pkg/util/proxy/upgradeaware_test.go       | 47 ++++++++++++++++++-
> + 4 files changed, 62 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/net/http.go b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/net/http.go
> +index 7449cbb0a01..7b64e68157e 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
> +@@ -446,7 +446,7 @@ redirectLoop:
> +
> +               // Only follow redirects to the same host. Otherwise,
> propagate the redirect response back.
> +               if requireSameHostRedirects && location.Hostname() !=
> originalLocation.Hostname() {
> +-                      break redirectLoop
> ++                      return nil, nil, fmt.Errorf("hostname mismatch:
> expected %s, found %s", originalLocation.Hostname(), location.Hostname())
> +               }
> +
> +               // Reset the connection.
> +diff --git a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/net/http_test.go b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/net/http_test.go
> +index da483c3563b..2fd3675d4fd 100644
> +--- a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/net/http_test.go
> ++++ b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/net/http_test.go
> +@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) {
> +               redirects:   []string{"/1", "/2", "/3", "/4", "/5", "/6",
> "/7", "/8", "/9", "/10"},
> +               expectError: true,
> +       }, {
> +-              desc:              "redirect to different host are
> prevented",
> +-              redirects:         []string{"http://example.com/foo"},
> +-              expectedRedirects: 0,
> ++              desc:        "redirect to different host are prevented",
> ++              redirects:   []string{"http://example.com/foo"},
> ++              expectError: true,
> +       }, {
> +-              desc:              "multiple redirect to different host
> forbidden",
> +-              redirects:         []string{"/1", "/2", "/3", "
> http://example.com/foo"},
> +-              expectedRedirects: 3,
> ++              desc:        "multiple redirect to different host
> forbidden",
> ++              redirects:   []string{"/1", "/2", "/3", "
> http://example.com/foo"},
> ++              expectError: true,
> +       }, {
> +               desc:              "redirect to different port is allowed",
> +               redirects:         []string{"http://HOST/foo"},
> +diff --git a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> +index d007c10b506..39c79be81bd 100644
> +--- a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> ++++ b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> +@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w
> http.ResponseWriter, req *http.Reques
> +               rawResponse = headerBytes
> +       }
> +
> ++      // If the backend did not upgrade the request, return an error to
> the client. If the response was
> ++      // an error, the error is forwarded directly after the connection
> is hijacked. Otherwise, just
> ++      // return a generic error here.
> ++      if backendHTTPResponse.StatusCode != http.StatusSwitchingProtocols
> && backendHTTPResponse.StatusCode < 400 {
> ++              err := fmt.Errorf("invalid upgrade response: status code
> %d", backendHTTPResponse.StatusCode)
> ++              klog.Errorf("Proxy upgrade error: %v", err)
> ++              h.Responder.Error(w, req, err)
> ++              return true
> ++      }
> ++
> +       // Once the connection is hijacked, the ErrorResponder will no
> longer work, so
> +       // hijacking should be the last step in the upgrade.
> +       requestHijacker, ok := w.(http.Hijacker)
> +diff --git a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
> b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
> +index 710fc6a9c21..c1dfb029d93 100644
> +--- a/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
> ++++ b/src/import/staging/src/
> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
> +@@ -512,7 +512,7 @@ func (r *noErrorsAllowed) Error(w
> http.ResponseWriter, req *http.Request, err er
> +       r.t.Error(err)
> + }
> +
> +-func TestProxyUpgradeErrorResponse(t *testing.T) {
> ++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {
> +       var (
> +               responder   *fakeResponder
> +               expectedErr = errors.New("EXPECTED")
> +@@ -560,7 +560,7 @@ func TestProxyUpgradeErrorResponse(t *testing.T) {
> +
> + func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
> +       for _, intercept := range []bool{true, false} {
> +-              for _, code := range []int{200, 400, 500} {
> ++              for _, code := range []int{400, 500} {
> +                       t.Run(fmt.Sprintf("intercept=%v,code=%v",
> intercept, code), func(t *testing.T) {
> +                               // Set up a backend server
> +                               backend := http.NewServeMux()
> +@@ -620,6 +620,49 @@ func TestProxyUpgradeErrorResponseTerminates(t
> *testing.T) {
> +       }
> + }
> +
> ++func TestProxyUpgradeErrorResponse(t *testing.T) {
> ++      for _, intercept := range []bool{true, false} {
> ++              for _, code := range []int{200, 300, 302, 307} {
> ++                      t.Run(fmt.Sprintf("intercept=%v,code=%v",
> intercept, code), func(t *testing.T) {
> ++                              // Set up a backend server
> ++                              backend := http.NewServeMux()
> ++                              backend.Handle("/hello",
> http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
> ++                                      http.Redirect(w, r, "
> https://example.com/there", code)
> ++                              }))
> ++                              backendServer :=
> httptest.NewServer(backend)
> ++                              defer backendServer.Close()
> ++                              backendServerURL, _ :=
> url.Parse(backendServer.URL)
> ++                              backendServerURL.Path = "/hello"
> ++
> ++                              // Set up a proxy pointing to a specific
> path on the backend
> ++                              proxyHandler :=
> NewUpgradeAwareHandler(backendServerURL, nil, false, false,
> &fakeResponder{t: t})
> ++                              proxyHandler.InterceptRedirects = intercept
> ++                              proxyHandler.RequireSameHostRedirects =
> true
> ++                              proxy := httptest.NewServer(proxyHandler)
> ++                              defer proxy.Close()
> ++                              proxyURL, _ := url.Parse(proxy.URL)
> ++
> ++                              conn, err := net.Dial("tcp", proxyURL.Host)
> ++                              require.NoError(t, err)
> ++                              bufferedReader := bufio.NewReader(conn)
> ++
> ++                              // Send upgrade request resulting in a
> non-101 response from the backend
> ++                              req, _ := http.NewRequest("GET", "/", nil)
> ++
> req.Header.Set(httpstream.HeaderConnection, httpstream.HeaderUpgrade)
> ++                              require.NoError(t, req.Write(conn))
> ++                              // Verify we get the correct response and
> full message body content
> ++                              resp, err :=
> http.ReadResponse(bufferedReader, nil)
> ++                              require.NoError(t, err)
> ++                              assert.Equal(t, fakeStatusCode,
> resp.StatusCode)
> ++                              resp.Body.Close()
> ++
> ++                              // clean up
> ++                              conn.Close()
> ++                      })
> ++              }
> ++      }
> ++}
> ++
> + func TestDefaultProxyTransport(t *testing.T) {
> +       tests := []struct {
> +               name,
> +--
> +2.20.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index d28e6a2..156e083 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -13,6 +13,7 @@ SRC_URI = "git://
> github.com/kubernetes/kubernetes.git;branch=release-1.18;name=k
>             git://
> github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release
> \
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>             file://0001-cross-don-t-build-tests-by-default.patch \
> +           file://0001-Don-t-return-proxied-redirects-to-the-client.patch
> \
>            "
>
>  DEPENDS += "rsync-native \
> --
> 2.17.1
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000aa170405ab6f837c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 27, 2020 at 1:14 PM &lt;<a href=3D"mail=
to:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Backported fix to re=
solve CVE-2020-8559.<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">This is on the release 1.18 branch, it=
 makes no sense to do a backport of an individual patch.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">We will refresh k8s again shortly, so it wi=
ll be picked up by that.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com=
" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0...turn-proxied-redirects-to-the-client.patch | 149 ++++++++++++++++=
++<br>
=C2=A0.../kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferre=
r" target=3D"_blank">kubernetes_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 150 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Don=
-t-return-proxied-redirects-to-the-client.patch<br>
<br>
diff --git a/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-pr=
oxied-redirects-to-the-client.patch b/recipes-containers/kubernetes/kuberne=
tes/0001-Don-t-return-proxied-redirects-to-the-client.patch<br>
new file mode 100644<br>
index 0000000..c4552cd<br>
--- /dev/null<br>
+++ b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-r=
edirects-to-the-client.patch<br>
@@ -0,0 +1,149 @@<br>
+From 469c439ea18cb6cc58e36357b9ead15d68122341 Mon Sep 17 00:00:00 2001<br=
>
+From: Tim Allclair &lt;<a href=3D"mailto:tallclair@google.com" target=3D"=
_blank">tallclair@google.com</a>&gt;<br>
+Date: Wed, 17 Jun 2020 11:09:02 -0700<br>
+Subject: [PATCH] Don&#39;t return proxied redirects to the client<br>
+<br>
+Upstream-Status: Backport [469c439ea18cb6cc58e36357b9ead15d68122341]<br>
+CVE: CVE-2020-8559<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
+<br>
+---<br>
+ .../<a href=3D"http://k8s.io/apimachinery/pkg/util/net/http.go" rel=3D"n=
oreferrer" target=3D"_blank">k8s.io/apimachinery/pkg/util/net/http.go</a>=
=C2=A0 |=C2=A0 2 +-<br>
+ .../apimachinery/pkg/util/net/http_test.go=C2=A0 =C2=A0 | 12 ++---<br>
+ .../pkg/util/proxy/upgradeaware.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 10 ++++<br>
+ .../pkg/util/proxy/upgradeaware_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 47 +=
+++++++++++++++++-<br>
+ 4 files changed, 62 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery=
/pkg/util/net/http.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachi=
nery/pkg/util/net/http.go</a> b/src/import/staging/src/<a href=3D"http://k8=
s.io/apimachinery/pkg/util/net/http.go" rel=3D"noreferrer" target=3D"_blank=
">k8s.io/apimachinery/pkg/util/net/http.go</a><br>
+index 7449cbb0a01..7b64e68157e 100644<br>
+--- a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/net/http.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery/pk=
g/util/net/http.go</a><br>
++++ b/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/net/http.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery/pk=
g/util/net/http.go</a><br>
+@@ -446,7 +446,7 @@ redirectLoop:<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Only follow red=
irects to the same host. Otherwise, propagate the redirect response back.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if requireSameHost=
Redirects &amp;&amp; location.Hostname() !=3D originalLocation.Hostname() {=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break redirectLoop<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return nil, nil, fmt.Errorf(&quot;hostname mismatch: expected %s, f=
ound %s&quot;, originalLocation.Hostname(), location.Hostname())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Reset the conne=
ction.<br>
+diff --git a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery=
/pkg/util/net/http_test.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/api=
machinery/pkg/util/net/http_test.go</a> b/src/import/staging/src/<a href=3D=
"http://k8s.io/apimachinery/pkg/util/net/http_test.go" rel=3D"noreferrer" t=
arget=3D"_blank">k8s.io/apimachinery/pkg/util/net/http_test.go</a><br>
+index da483c3563b..2fd3675d4fd 100644<br>
+--- a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/net/http_test.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachine=
ry/pkg/util/net/http_test.go</a><br>
++++ b/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/net/http_test.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachine=
ry/pkg/util/net/http_test.go</a><br>
+@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirects:=C2=A0 =
=C2=A0[]string{&quot;/1&quot;, &quot;/2&quot;, &quot;/3&quot;, &quot;/4&qu=
ot;, &quot;/5&quot;, &quot;/6&quot;, &quot;/7&quot;, &quot;/8&quot;, &quot;=
/9&quot;, &quot;/10&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expectError: true,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;redirect to different host are preve=
nted&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 redirects:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0[]string{&quot;<a href=3D"http://example.com/foo" rel=
=3D"noreferrer" target=3D"_blank">http://example.com/foo</a>&quot;},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expectedRedirects: 0,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;redirect to different host are prevented&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 redirects:=C2=A0 =C2=A0=
[]string{&quot;<a href=3D"http://example.com/foo" rel=3D"noreferrer" target=
=
=3D"_blank">http://example.com/foo</a>&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expectError: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;multiple redirect to different host =
forbidden&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 redirects:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0[]string{&quot;/1&quot;, &quot;/2&quot;, &quot;/3&quot=
;, &quot;<a href=3D"http://example.com/foo" rel=3D"noreferrer" target=3D"_b=
lank">http://example.com/foo</a>&quot;},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expectedRedirects: 3,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;multiple redirect to different host forbidden&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 redirects:=C2=A0 =C2=A0=
[]string{&quot;/1&quot;, &quot;/2&quot;, &quot;/3&quot;, &quot;<a href=3D"h=
ttp://example.com/foo" rel=3D"noreferrer" target=3D"_blank">http://example.=
com/foo</a>&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expectError: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;redirect to different port is all=
owed&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirects:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[]string{&quot;<a href=3D"http://HOST/foo" rel=
=3D"noreferrer" target=3D"_blank">http://HOST/foo</a>&quot;},<br>
+diff --git a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery=
/pkg/util/proxy/upgradeaware.go" rel=3D"noreferrer" target=3D"_blank">k8s.i=
o/apimachinery/pkg/util/proxy/upgradeaware.go</a> b/src/import/staging/src/=
<a href=3D"http://k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go" rel=
=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery/pkg/util/proxy/upgra=
deaware.go</a><br>
+index d007c10b506..39c79be81bd 100644<br>
+--- a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/proxy/upgradeaware.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apima=
chinery/pkg/util/proxy/upgradeaware.go</a><br>
++++ b/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/proxy/upgradeaware.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apima=
chinery/pkg/util/proxy/upgradeaware.go</a><br>
+@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.Resp=
onseWriter, req *http.Reques<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rawResponse =3D he=
aderBytes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 // If the backend did not upgrade the request, retu=
rn an error to the client. If the response was<br>
++=C2=A0 =C2=A0 =C2=A0 // an error, the error is forwarded directly after =
the connection is hijacked. Otherwise, just<br>
++=C2=A0 =C2=A0 =C2=A0 // return a generic error here.<br>
++=C2=A0 =C2=A0 =C2=A0 if backendHTTPResponse.StatusCode !=3D http.StatusS=
witchingProtocols &amp;&amp; backendHTTPResponse.StatusCode &lt; 400 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D fmt.Errorf(&qu=
ot;invalid upgrade response: status code %d&quot;, backendHTTPResponse.Stat=
usCode)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 klog.Errorf(&quot;Proxy=
 upgrade error: %v&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h.Responder.Error(w, re=
q, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Once the connection is hijacked, the ErrorR=
esponder will no longer work, so<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// hijacking should be the last step in the up=
grade.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0requestHijacker, ok :=3D w.(http.Hijacker)<br>
+diff --git a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery=
/pkg/util/proxy/upgradeaware_test.go" rel=3D"noreferrer" target=3D"_blank">=
k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go</a> b/src/import/st=
aging/src/<a href=3D"http://k8s.io/apimachinery/pkg/util/proxy/upgradeaware=
_test.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery/pkg/util=
/proxy/upgradeaware_test.go</a><br>
+index 710fc6a9c21..c1dfb029d93 100644<br>
+--- a/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/proxy/upgradeaware_test.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/=
apimachinery/pkg/util/proxy/upgradeaware_test.go</a><br>
++++ b/src/import/staging/src/<a href=3D"http://k8s.io/apimachinery/pkg/ut=
il/proxy/upgradeaware_test.go" rel=3D"noreferrer" target=3D"_blank">k8s.io/=
apimachinery/pkg/util/proxy/upgradeaware_test.go</a><br>
+@@ -512,7 +512,7 @@ func (r *noErrorsAllowed) Error(w http.ResponseWriter=
, req *http.Request, err er<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r.t.Error(err)<br>
+ }<br>
+ <br>
+-func TestProxyUpgradeErrorResponse(t *testing.T) {<br>
++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0responder=C2=A0 =
=C2=A0*fakeResponder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expectedErr =3D er=
rors.New(&quot;EXPECTED&quot;)<br>
+@@ -560,7 +560,7 @@ func TestProxyUpgradeErrorResponse(t *testing.T) {<br=
>
+ <br>
+ func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, intercept :=3D range []bool{true, false=
} {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, code :=3D range =
[]int{200, 400, 500} {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, code :=3D range =
[]int{400, 500} {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0t.Run(fmt.Sprintf(&quot;intercept=3D%v,code=3D%v&quot;, intercep=
t, code), func(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Set up a backend server<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend :=3D http.NewServeMux()<br>
+@@ -620,6 +620,49 @@ func TestProxyUpgradeErrorResponseTerminates(t *test=
ing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
++func TestProxyUpgradeErrorResponse(t *testing.T) {<br>
++=C2=A0 =C2=A0 =C2=A0 for _, intercept :=3D range []bool{true, false} {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, code :=3D range =
[]int{200, 300, 302, 307} {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 t.Run(fmt.Sprintf(&quot;intercept=3D%v,code=3D%v&quot;, intercept, =
code), func(t *testing.T) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Set up a backend server<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backend :=3D http.NewServeMux()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backend.Handle(&quot;/hello&quot;, http=
.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http.Redire=
ct(w, r, &quot;<a href=3D"https://example.com/there" rel=3D"noreferrer" tar=
get=3D"_blank">https://example.com/there</a>&quot;, code)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backendServer :=3D httptest.NewServer(b=
ackend)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer backendServer.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backendServerURL, _ :=3D url.Parse(back=
endServer.URL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backendServerURL.Path =3D &quot;/hello&=
quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Set up a proxy pointing to a specifi=
c path on the backend<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxyHandler :=3D NewUpgradeAwareHandle=
r(backendServerURL, nil, false, false, &amp;fakeResponder{t: t})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxyHandler.InterceptRedirects =3D int=
ercept<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxyHandler.RequireSameHostRedirects =
=3D true<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy :=3D httptest.NewServer(proxyHand=
ler)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer proxy.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxyURL, _ :=3D url.Parse(proxy.URL)<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn, err :=3D net.Dial(&quot;tcp&quot;=
, proxyURL.Host)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require.NoError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bufferedReader :=3D bufio.NewReader(con=
n)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Send upgrade request resulting in a =
non-101 response from the backend<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req, _ :=3D http.NewRequest(&quot;GET&q=
uot;, &quot;/&quot;, nil)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req.Header.Set(httpstream.HeaderConnect=
ion, httpstream.HeaderUpgrade)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require.NoError(t, req.Write(conn))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Verify we get the correct response a=
nd full message body content<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp, err :=3D http.ReadResponse(buffer=
edReader, nil)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require.NoError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert.Equal(t, fakeStatusCode, resp.St=
atusCode)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp.Body.Close()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // clean up<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 })<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ func TestDefaultProxyTransport(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tests :=3D []struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name,<br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/recipes-=
containers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferre=
r" target=3D"_blank">kubernetes_git.bb</a><br>
index d28e6a2..156e083 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" r=
el=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" r=
el=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -13,6 +13,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/kub=
ernetes/kubernetes.git;branch=3Drelease-1.18;name=3Dk" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/kubernetes/kubernetes.git;branch=3Drelease-1.18=
;name=3Dk</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.c=
om/kubernetes/release;branch=3Dmaster;name=3Dkubernetes-release;destsuffix=
=3Dgit/release" rel=3D"noreferrer" target=3D"_blank">github.com/kubernetes=
/release;branch=3Dmaster;name=3Dkubernetes-release;destsuffix=3Dgit/release=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-hack-lib-golang.sh-u=
se-CC-from-environment.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cross-don-t-build-te=
sts-by-default.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Don-t-return-proxied=
-redirects-to-the-client.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;rsync-native \<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000aa170405ab6f837c--
