Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A6AAE00D44; Thu,  9 Jun 2016 05:48:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F4200E00D3B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Jun 2016 05:48:19 -0700 (PDT)
Received: by mail-lf0-f51.google.com with SMTP id u74so25560691lff.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Jun 2016 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=+Tjunb5ibPWJgBzYyfk0U+8KI4T6IsatLFE0ZHz6Txc=;
	b=Obxsxxe531RxMmIDpx83wbdMPuCsdwsUKH0k4p4NPO/ns66CZmuEm8ZwLIrG35+aJo
	v37WaaIYCdM9vlQzi1UA9Ng/t932VkdadLVfNGJsAhmvO05xwL0dYCnBsWvpOnHNRWCC
	V9HsEI2wQG5Rl5Qh0uidp9FxGd5FxCaeacVF9vztSICmCWbXIac8eXG+EPz2aBCFj3j9
	CHqSjNTTAedf/aGKmIuTQXaNfVxZQduR9rj30kHXiQEJ5SQQV790NszQCmE6Cv3DHA2/
	a7N3XCfDrLylBPT3eA/m6Sha4b1Vs8Y885njeG20h6Tb3OzuJSN4xdECwspDLJ53PDNQ
	D7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+Tjunb5ibPWJgBzYyfk0U+8KI4T6IsatLFE0ZHz6Txc=;
	b=gmxwKKgcubog7PuLx+1wPeZ2eNImzMBhRJFRPT1ZWa/KKDXrnqZIMHq37qzauGZ0QS
	eSmVZ5exHXTvo7kS1kkPR0ART2X5j6bt2hMUnrTPJyp5iLVh0b+NG9+4SPRaTk9t6t8H
	2uy0MCicXm7Mmg1xia179J3aEI0YzeO/zc8bSxmTE/9yKrezpq/V0xGlruIo03mLWbZG
	6yIXYqAwSwI0R6ejORTO+ktS0bUtjZecb3A+nMX0UpOHmJCsOS5bFPQhfFcyT1l3rl/V
	6AOfWiFCWgpV283Qjk9+V4ATEY6fT5iD0KsglJ7l61mXlXR7p8+DEXARVKu8WBnMOBZ8
	wXAA==
X-Gm-Message-State: ALyK8tLKHTfRXHsg0PCb2DB0hRTgLYF863M2bXi7JN7wwihfJGIcUqOWA6ZspWnXdFsgX/RhEAZHJCWlTNl7yA==
X-Received: by 10.25.15.213 with SMTP id 82mr2683843lfp.126.1465476497593;
	Thu, 09 Jun 2016 05:48:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Thu, 9 Jun 2016 05:47:48 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 9 Jun 2016 09:47:48 -0300
Message-ID: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: [krogoth] Golang errors when building Docker
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
X-List-Received-Date: Thu, 09 Jun 2016 12:48:23 -0000
Content-Type: multipart/alternative; boundary=001a113fb78a10e9c10534d7d6d7

--001a113fb78a10e9c10534d7d6d7
Content-Type: text/plain; charset=UTF-8

Hi all!

I'm getting some errors when building Docker. First, go-cross and go-native
print these messages:

-----------------------------------------------------------------------
ERROR: go-cross-1.5.2-r0 do_populate_sysroot_setscene:
'('patchelf-uninative',
'--set-interpreter',
'/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
'/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/sstate-install-populate_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go')'
failed with exit code 1 and the following output:
cannot find section .rela.dyn

WARNING: Logfile for failed setscene task is
/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_setscene.28109
WARNING: Setscene task 458
(/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
go-cross_1.5.bb,
do_populate_sysroot_setscene) failed with exit code '1' - real task will be
run
instead
-----------------------------------------------------------------------

ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene:
'('patchelf-uninative',
'--set-interpreter',
'/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
'/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go')'
failed with exit code 1 and the following output:
cannot find section .rela.dyn

WARNING: Logfile for failed setscene task is
/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_populate_sysroot_setscene.29146
WARNING: Setscene task 908
(/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
go-native_1.4.bb,
do_populate_sysroot_setscene) failed with exit code '1' - real task will be
run
instead
-----------------------------------------------------------------------

And there are two Docker dependencies, go-net and go-sqlite, that cannot
fetch
sources.

-----------------------------------------------------------------------
WARNING: go-net-hg-r0 do_fetch: Failed to fetch URL hg://
code.google.com/p;module=go.net, attempting MIRRORS if available
ERROR: go-net-hg-r0 do_fetch: Fetcher failure: Fetch command failed with
exit code 255, output:
abort: HTTP Error 404: Not Found

ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher failure for URL:
'hg://code.google.com/p;module=go.net'. Unable to fetch URL from any source.
-----------------------------------------------------------------------

WARNING: go-sqlite-hg-r0 do_fetch: Failed to fetch URL hg://
code.google.com/p;module=gosqlite, attempting MIRRORS if available
ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch command failed with
exit code 255, output:
abort: HTTP Error 404: Not Found

ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure for URL:
'hg://code.google.com/p;module=gosqlite'. Unable to fetch URL from any
source.
-----------------------------------------------------------------------

Can someone help me to resolve these errors? I'm using krogoth branch for
oe-core, meta-oe and meta-virtualization.

Regards,

Fabio

--001a113fb78a10e9c10534d7d6d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi all!<br><br>I&#39;m getting some errors whe=
n building Docker. First, go-cross and go-native<br>print these messages:<b=
r><br>---------------------------------------------------------------------=
--<br>ERROR: go-cross-1.5.2-r0 do_populate_sysroot_setscene: &#39;(&#39;pat=
chelf-uninative&#39;,<br>&#39;--set-interpreter&#39;,<br>&#39;/home/user/sr=
c/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#3=
9;,<br>&#39;/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r=
0/sstate-install-populate_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go=
&#39;)&#39;<br>failed with exit code 1 and the following output:<br>cannot =
find section .rela.dyn<br><br>WARNING: Logfile for failed setscene task is<=
br>/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/lo=
g.do_populate_sysroot_setscene.28109<br>WARNING: Setscene task 458<br>(/hom=
e/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/<a hre=
f=3D"http://go-cross_1.5.bb">go-cross_1.5.bb</a>,<br>do_populate_sysroot_se=
tscene) failed with exit code &#39;1&#39; - real task will be run<br>instea=
d<br>----------------------------------------------------------------------=
-<br><br>ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene: &#39;(&#39=
;patchelf-uninative&#39;,<br>&#39;--set-interpreter&#39;,<br>&#39;/home/use=
r/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.=
2&#39;,<br>&#39;/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.=
4.3-r0/sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go&#39;)=
&#39;<br>failed with exit code 1 and the following output:<br>cannot find s=
ection .rela.dyn<br><br>WARNING: Logfile for failed setscene task is<br>/ho=
me/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_=
populate_sysroot_setscene.29146<br>WARNING: Setscene task 908<br>(/home/use=
r/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/<a href=3D"=
http://go-native_1.4.bb">go-native_1.4.bb</a>,<br>do_populate_sysroot_setsc=
ene) failed with exit code &#39;1&#39; - real task will be run<br>instead<b=
r>-----------------------------------------------------------------------<b=
r><br>And there are two Docker dependencies, go-net and go-sqlite, that can=
not fetch<br>sources.<br><br>----------------------------------------------=
-------------------------<br>WARNING: go-net-hg-r0 do_fetch: Failed to fetc=
h URL hg://<a href=3D"http://code.google.com/p;module=3Dgo.net">code.google=
.com/p;module=3Dgo.net</a>, attempting MIRRORS if available<br>ERROR: go-ne=
t-hg-r0 do_fetch: Fetcher failure: Fetch command failed with exit code 255,=
 output:<br>abort: HTTP Error 404: Not Found<br><br>ERROR: go-net-hg-r0 do_=
fetch: Function failed: Fetcher failure for URL: &#39;hg://<a href=3D"http:=
//code.google.com/p;module=3Dgo.net">code.google.com/p;module=3Dgo.net</a>&=
#39;. Unable to fetch URL from any source.<br>-----------------------------=
------------------------------------------<br><br>WARNING: go-sqlite-hg-r0 =
do_fetch: Failed to fetch URL hg://<a href=3D"http://code.google.com/p;modu=
le=3Dgosqlite">code.google.com/p;module=3Dgosqlite</a>, attempting MIRRORS =
if available<br>ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch com=
mand failed with exit code 255, output:<br>abort: HTTP Error 404: Not Found=
<br><br>ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure f=
or URL: &#39;hg://<a href=3D"http://code.google.com/p;module=3Dgosqlite">co=
de.google.com/p;module=3Dgosqlite</a>&#39;. Unable to fetch URL from any so=
urce.<br>------------------------------------------------------------------=
-----<br><br>Can someone help me to resolve these errors? I&#39;m using kro=
goth branch for oe-core, meta-oe and meta-virtualization.<br><br>Regards,<b=
r><br>Fabio<br></div></div>

--001a113fb78a10e9c10534d7d6d7--
