Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.17902.1575188230557283727
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 00:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xB18H9BK024923
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 1 Dec 2019 00:17:09 -0800
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Sun, 1 Dec 2019
 00:17:08 -0800
Subject: Re: [meta-virtualization][PATCH] cri-o: workaround failure since go upgraded to 1.13
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
References: <15DC311BA181894D.8832@lists.yoctoproject.org>
Message-ID: <984bdc65-03bb-587c-7ef8-6b563aae00dd@windriver.com>
Date: Sun, 1 Dec 2019 16:17:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15DC311BA181894D.8832@lists.yoctoproject.org>
Content-Type: multipart/alternative;
	boundary="------------6399FD14505997E24E9A811D"
Content-Language: en-US

--------------6399FD14505997E24E9A811D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/19 4:12 PM, hongxu wrote:
> Since go was upgraded to 1.13, there is a failure:
> ...
> | src/vendor/golang.org/x/net/http2/frame.go:17:2: use of vendored package not allowed
> | ../../../recipe-sysroot/usr/lib64/go/src/net/http/h2_bundle.go:49:2: use of vendored package not allowed
> ...
>
> Refer upstream suggestion [1]:
> `or copying your vendor contents into GOPATH/src rather than
> mapping them in to GOPATH/src/vendor.'
>
> [1] https://github.com/prometheus/prometheus/issues/1720

Sorry for the wrong link, V2 incoming

//Hongxu

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   recipes-containers/cri-o/cri-o_git.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 8d754ec..4fee385 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -109,6 +109,9 @@ do_compile() {
>   	# fixes the bin/crio build of oe_runmake binaries below
>   	ln -sf ../../../../cmd/crio ${S}/src/import/src/github.com/cri-o/cri-o/cmd/
>   
> +	# workaround `use of vendored package not allowed' failure
> +	mv ${S}/src/import/vendor/golang.org  ${S}/src/import/
> +
>   	cd ${S}/src/import
>   
>   	if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4788): https://lists.yoctoproject.org/g/meta-virtualization/message/4788
> Mute This Topic: https://lists.yoctoproject.org/mt/64419739/3617049
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-



--------------6399FD14505997E24E9A811D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 12/1/19 4:12 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15DC311BA181894D.8832@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">Since go was upgraded to 1.13, there is a failure:
...
| src/vendor/golang.org/x/net/http2/frame.go:17:2: use of vendored package not allowed
| ../../../recipe-sysroot/usr/lib64/go/src/net/http/h2_bundle.go:49:2: use of vendored package not allowed
...

Refer upstream suggestion [1]:
`or copying your vendor contents into GOPATH/src rather than
mapping them in to GOPATH/src/vendor.'

[1] <a class="moz-txt-link-freetext" href="https://github.com/prometheus/prometheus/issues/1720">https://github.com/prometheus/prometheus/issues/1720</a>
</pre>
    </blockquote>
    <p>Sorry for the wrong link, V2 incoming</p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite"
      cite="mid:15DC311BA181894D.8832@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 recipes-containers/cri-o/cri-o_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 8d754ec..4fee385 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -109,6 +109,9 @@ do_compile() {
 	# fixes the bin/crio build of oe_runmake binaries below
 	ln -sf ../../../../cmd/crio ${S}/src/import/src/github.com/cri-o/cri-o/cmd/
 
+	# workaround `use of vendored package not allowed' failure
+	mv ${S}/src/import/vendor/golang.org  ${S}/src/import/
+
 	cd ${S}/src/import
 
 	if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#4788): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/4788">https://lists.yoctoproject.org/g/meta-virtualization/message/4788</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/64419739/3617049">https://lists.yoctoproject.org/mt/64419739/3617049</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6399FD14505997E24E9A811D--
