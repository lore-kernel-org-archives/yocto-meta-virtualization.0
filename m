Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2E4FE00BC2; Mon, 10 Jul 2017 08:47:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.50 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.50 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB07FE00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:47:16 -0700 (PDT)
Received: by mail-lf0-f50.google.com with SMTP id z78so65553747lff.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SWGt3Fa0mftj24w4MZjNJRUO4E2AN3+P+bfg1d44Wus=;
	b=R0Exs3G10+JAWpjKC+AFG/+YNUjhXIV3zrHdTTkzxVxMJyUnwWQmCdJOuF7FNxtzim
	yazULfX+C5T7NYbILkaPfC4pmNxigkQj0MvWBCH0ZmnHo9PMsOELMttv301q94KsoiJ/
	OJSEkl13qVMSY5FOh9Zi0Ap9viEmd+VjdNT+Z5UlDrHhPthayDNNTF0+kU5nuF01L8BT
	rjw1VLK1rfDEHfrWlN0cJJCpfdke31Z0XQ8nYCI/GHXfBxXPpltE+4zKT2sbX38SbYW/
	vkCpWuU01Ft5NrEaY/E6OvLcaJrDPV4FgNGaMZJK8wgI/ubuD4kFMCTvRvW3msqtTAcf
	ddwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SWGt3Fa0mftj24w4MZjNJRUO4E2AN3+P+bfg1d44Wus=;
	b=eErKSXXXMDADzgaperDm5yq0eaJUIpu9oJoRabsWxYwDKD9eKEuDsvKl6cN4w/2BRM
	FdQgqTgt7N494wJ+7TwMRhYQJiV8I+XOu2brM/yGX+fz//8XHrkd9oknIE7++FAXbDpa
	EIp13QQRd8TbBbY9126Kn++/igJj/ohXf5Ml+0dihy8tGGvTReeAH/hzbdmoSy0+RZik
	5kPRWKG+MWgY4yp0P4UqQ+NhmfbWXFRpc6bTO7Z+hPSybySe1FFnVp9wHkAuCOLWaSXN
	quRTzYUz6wwv9Mo/2aBKpdOJ7dHhcOVhmc2o1XxJcgDzynj7RuIKMemhkVecd0R/p8Su
	x8Xw==
X-Gm-Message-State: AIVw111JyKKdOwD6tEkjPwUePDvTDW/6xP8foVo/FJ94YGP9haMs7bXS
	Y9dadKczdXnMJcHkiVP6PklGjyP3uQ==
X-Received: by 10.46.22.5 with SMTP id w5mr4801769ljd.26.1499701635540; Mon,
	10 Jul 2017 08:47:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 08:47:15 -0700 (PDT)
In-Reply-To: <1499698939-31739-1-git-send-email-jeffrey.pautler@ni.com>
References: <1499698939-31739-1-git-send-email-jeffrey.pautler@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 11:47:15 -0400
Message-ID: <CADkTA4PbOz+vbqf6zt_6n5YpjfKaqytRGsPSjqjek4rGH8W+fQ@mail.gmail.com>
To: Jeffrey Pautler <jeffrey.pautler@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-salttesting: Modify patch to improve ptest output
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 15:47:18 -0000
Content-Type: multipart/alternative; boundary="f403045fbada41713f0553f87ff8"

--f403045fbada41713f0553f87ff8
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jul 10, 2017 at 11:02 AM, Jeffrey Pautler <jeffrey.pautler@ni.com>
wrote:

> Current test case output includes shortDescription and looks like this:
> PASS: [CPU:24.1%|MEM:17.4%] First line of test case doc string
>
> New test case output replaces shortDescription with test name and looks
> like this:
> PASS: test_case_function_name
>
> Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
> ---
>  .../0001-Add-ptest-output-option-to-test-suite.patch  | 19
> ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> b/meta-openstack/recipes-devtools/python/python-
> salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> index c297320..e86768a 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> @@ -1,4 +1,4 @@
> -From 7e2642530bfd4ac0226b90404e7a4511e44756b6 Mon Sep 17 00:00:00 2001
> +From 1950b943b7173198f345a1cff7b7f771cbac2244 Mon Sep 17 00:00:00 2001
>  From: Collin Richards <collin.richards@ni.com>
>  Date: Tue, 28 Jun 2016 16:02:22 -0500
>  Subject: [PATCH] Add ptest output option to test suite
> @@ -12,12 +12,12 @@ Signed-off-by: Collin Richards <collin.richards@ni.com
> >
>  Natinst-ReviewBoard-ID: 143279
>  ---
>   salttesting/parser/__init__.py |  12 +++
> - salttesting/ptest.py           | 168 ++++++++++++++++++++++++++++++
> +++++++++++
> - 2 files changed, 180 insertions(+)
> + salttesting/ptest.py           | 165 ++++++++++++++++++++++++++++++
> +++++++++++
> + 2 files changed, 177 insertions(+)
>   create mode 100644 salttesting/ptest.py
>
>  diff --git a/salttesting/parser/__init__.py
> b/salttesting/parser/__init__.py
> -index 1e7275b4b65ef29deb89049a70bf6a074e11873d..
> d8cba0cb1e4814b7065b6896186c25300048ec92 100644
> +index 1e7275b..d8cba0c 100644
>  --- a/salttesting/parser/__init__.py
>  +++ b/salttesting/parser/__init__.py
>  @@ -25,6 +25,7 @@ from functools import partial
> @@ -55,10 +55,10 @@ index 1e7275b4b65ef29deb89049a70bf6a074e11873d..
> d8cba0cb1e4814b7065b6896186c2530
>                   stream=sys.stdout,
>  diff --git a/salttesting/ptest.py b/salttesting/ptest.py
>  new file mode 100644
> -index 0000000000000000000000000000000000000000..
> 9780886bc8f9d400aab2e96a33b14af980e64315
> +index 0000000..4c50f57
>  --- /dev/null
>  +++ b/salttesting/ptest.py
> -@@ -0,0 +1,168 @@
> +@@ -0,0 +1,165 @@
>  +# -*- coding: utf-8 -*-
>  +
>  +"""
> @@ -158,10 +158,7 @@ index 0000000000000000000000000000000000000000..
> 9780886bc8f9d400aab2e96a33b14af9
>  +        self.descriptions = descriptions
>  +
>  +    def getDescription(self, test):
> -+        if self.descriptions:
> -+            return test.shortDescription() or str(test)
> -+        else:
> -+            return str(test)
> ++        return str(test)
>  +
>  +    def startTest(self, test):
>  +        TestResult.startTest(self, test)
> @@ -228,5 +225,5 @@ index 0000000000000000000000000000000000000000..
> 9780886bc8f9d400aab2e96a33b14af9
>  +        self.stream.writeln()
>  +        return result
>  --
> -1.9.1
> +2.13.2
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045fbada41713f0553f87ff8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jul 10, 2017 at 11:02 A=
M, Jeffrey Pautler <span dir=3D"ltr">&lt;<a href=3D"mailto:jeffrey.pautler@=
ni.com" target=3D"_blank">jeffrey.pautler@ni.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Current test case output includes shortDescri=
ption and looks like this:<br>
PASS: [CPU:24.1%|MEM:17.4%] First line of test case doc string<br>
<br>
New test case output replaces shortDescription with test name and looks<br>
like this:<br>
PASS: test_case_function_name<br>
<br>
Signed-off-by: Jeffrey Pautler &lt;<a href=3D"mailto:jeffrey.pautler@ni.com=
">jeffrey.pautler@ni.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Add-ptest-output-<wbr>option-to-test-suite.patch=C2=A0 | 19 =
++++++++-----------<br>
=C2=A01 file changed, 8 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>saltte=
sting/0001-Add-ptest-<wbr>output-option-to-test-suite.<wbr>patch b/meta-ope=
nstack/recipes-<wbr>devtools/python/python-<wbr>salttesting/0001-Add-ptest-=
<wbr>output-option-to-test-suite.<wbr>patch<br>
index c297320..e86768a 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>salttesting/0=
001-Add-ptest-<wbr>output-option-to-test-suite.<wbr>patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>salttesting/0=
001-Add-ptest-<wbr>output-option-to-test-suite.<wbr>patch<br>
@@ -1,4 +1,4 @@<br>
-From 7e2642530bfd4ac0226b90404e7a45<wbr>11e44756b6 Mon Sep 17 00:00:00 200=
1<br>
+From 1950b943b7173198f345a1cff7b7f7<wbr>71cbac2244 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Collin Richards &lt;<a href=3D"mailto:collin.richards@ni.com">c=
ollin.richards@ni.com</a>&gt;<br>
=C2=A0Date: Tue, 28 Jun 2016 16:02:22 -0500<br>
=C2=A0Subject: [PATCH] Add ptest output option to test suite<br>
@@ -12,12 +12,12 @@ Signed-off-by: Collin Richards &lt;<a href=3D"mailto:co=
llin.richards@ni.com">collin.richards@ni.com</a>&gt;<br>
=C2=A0Natinst-ReviewBoard-ID: 143279<br>
=C2=A0---<br>
=C2=A0 salttesting/parser/__init__.py |=C2=A0 12 +++<br>
- salttesting/ptest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 168 ++++++=
++++++++++++++++++++++++<wbr>+++++++++++<br>
- 2 files changed, 180 insertions(+)<br>
+ salttesting/ptest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 165 ++++++=
++++++++++++++++++++++++<wbr>+++++++++++<br>
+ 2 files changed, 177 insertions(+)<br>
=C2=A0 create mode 100644 salttesting/ptest.py<br>
<br>
=C2=A0diff --git a/salttesting/parser/__init__.<wbr>py b/salttesting/parser=
/__init__.<wbr>py<br>
-index 1e7275b4b65ef29deb89049a70bf6a<wbr>074e11873d..<wbr>d8cba0cb1e4814b7=
065b6896186c25<wbr>300048ec92 100644<br>
+index 1e7275b..d8cba0c 100644<br>
=C2=A0--- a/salttesting/parser/__init__.<wbr>py<br>
=C2=A0+++ b/salttesting/parser/__init__.<wbr>py<br>
=C2=A0@@ -25,6 +25,7 @@ from functools import partial<br>
@@ -55,10 +55,10 @@ index 1e7275b4b65ef29deb89049a70bf6a<wbr>074e11873d..<w=
br>d8cba0cb1e4814b7065b6896186c25<wbr>30<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream=3Dsys=
.stdout,<br>
=C2=A0diff --git a/salttesting/ptest.py b/salttesting/ptest.py<br>
=C2=A0new file mode 100644<br>
-index 000000000000000000000000000000<wbr>0000000000..<wbr>9780886bc8f9d400=
aab2e96a33b14a<wbr>f980e64315<br>
+index 0000000..4c50f57<br>
=C2=A0--- /dev/null<br>
=C2=A0+++ b/salttesting/ptest.py<br>
-@@ -0,0 +1,168 @@<br>
+@@ -0,0 +1,165 @@<br>
=C2=A0+# -*- coding: utf-8 -*-<br>
=C2=A0+<br>
=C2=A0+&quot;&quot;&quot;<br>
@@ -158,10 +158,7 @@ index 000000000000000000000000000000<wbr>0000000000..<=
wbr>9780886bc8f9d400aab2e96a33b14a<wbr>f9<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.descriptions =3D descriptions<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 def getDescription(self, test):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.descriptions:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return test.shortDescription() =
or str(test)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return str(test)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return str(test)<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 def startTest(self, test):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestResult.startTest(self, test)<br>
@@ -228,5 +225,5 @@ index 000000000000000000000000000000<wbr>0000000000..<w=
br>9780886bc8f9d400aab2e96a33b14a<wbr>f9<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln()<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return result<br>
=C2=A0--<br>
-1.9.1<br>
+2.13.2<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--f403045fbada41713f0553f87ff8--
