Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B68D8E007DF; Tue, 30 Sep 2014 15:44:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79456E0034C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 15:43:55 -0700 (PDT)
Received: by mail-vc0-f172.google.com with SMTP id lf12so3761037vcb.31
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 15:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=paiwAzfHgkpixskAIVOIZ2iSwRbXJC7JL589iBGNWCw=;
	b=FwByicrnffmC+++YwON8WD42DdPJAQ8+HVsO3T1i32226xjFLzOuYVYFPLcPIfjKpr
	NF9fcdjQ/Drko2BcY7132YrzO1SPNmskE/ZhM0AMaq6GI/pn4Ue2zGGw92tWlPjvf9Mo
	d4pwEsAIOri2AOe1eDeOqIImKto6dQ4I5byAMkAVzrxksq4Jbs497K655kFZAe611T5x
	7pgoawpoq2W8gLfv16DxV4xMda6yhl3co4r4RbIEGYxO0KGfLzriS92/u13tip3QEPVr
	Tg7+wAsNJNJmFgS1gOQI76PTWtAlQ0TsA5273/qCROn++S9xXhfAys3Cco/ZxMwI2DwL
	2k4g==
MIME-Version: 1.0
X-Received: by 10.52.115.225 with SMTP id jr1mr16964867vdb.27.1412117035238;
	Tue, 30 Sep 2014 15:43:55 -0700 (PDT)
Received: by 10.52.112.65 with HTTP; Tue, 30 Sep 2014 15:43:55 -0700 (PDT)
Date: Tue, 30 Sep 2014 15:43:55 -0700
Message-ID: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: uwsgi fails to get packaged with bad RPATH
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
X-List-Received-Date: Tue, 30 Sep 2014 22:44:01 -0000
Content-Type: multipart/alternative; boundary=bcaec547c5e5444c400504501e47

--bcaec547c5e5444c400504501e47
Content-Type: text/plain; charset=UTF-8

Hello everyone, I am building uwsgi as a part of my image to run a web
application on my embedded board.

Ingredients including nginx builds fine, but I am getting the error
attached. I am building on Yocto Project 1.6.1 (current master).

Any insight will be greatly appreciated!

Adam

DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_package
> DEBUG: Executing python function package_get_auto_pr
> DEBUG: Python function package_get_auto_pr finished
> DEBUG: Executing python function perform_packagecopy
> DEBUG: Python function perform_packagecopy finished
> DEBUG: Executing python function split_and_strip_files
> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip' --remove-section=.comment
> --remove-section=.note
> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
> DEBUG: Python function split_and_strip_files finished
> DEBUG: Executing python function fixup_perms
> DEBUG: Python function fixup_perms finished
> DEBUG: Executing python function package_do_split_locales
> DEBUG: No locale files in this package
> DEBUG: Python function package_do_split_locales finished
> DEBUG: Executing python function populate_packages
> DEBUG: Python function populate_packages finished
> DEBUG: Executing python function do_package_qa
> NOTE: DO PACKAGE QA
> NOTE: Checking Package: uwsgi-staticdev
> NOTE: Checking Package: uwsgi-dev
> NOTE: Checking Package: uwsgi-dbg
> NOTE: arm-poky-linux-gnueabi-objdump -p
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
> NOTE: Checking Package: uwsgi-doc
> NOTE: Checking Package: uwsgi
> NOTE: arm-poky-linux-gnueabi-objdump -p
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> ERROR: QA Issue: package uwsgi contains bad RPATH
> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> ERROR: QA run found fatal errors. Please consider fixing them.
> DEBUG: Python function do_package_qa finished
> DEBUG: Python function do_package finished
> ERROR: Function failed: do_package_qa

--bcaec547c5e5444c400504501e47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone, I am building uwsgi as a part of my image =
to run a web application on my embedded board.=C2=A0<div><br></div><div>Ing=
redients including nginx builds fine, but I am getting the error attached. =
I am building on Yocto Project 1.6.1 (current master).=C2=A0</div><div><br>=
</div><div>Any insight will be greatly appreciated!</div><div><br></div><di=
v>Adam</div><div><br></div><div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex">DEBUG: Executing python fu=
nction sstate_task_prefunc<br>DEBUG: Python function sstate_task_prefunc fi=
nished<br>DEBUG: Executing python function do_package<br>DEBUG: Executing p=
ython function package_get_auto_pr<br>DEBUG: Python function package_get_au=
to_pr finished<br>DEBUG: Executing python function perform_packagecopy<br>D=
EBUG: Python function perform_packagecopy finished<br>DEBUG: Executing pyth=
on function split_and_strip_files<br>DEBUG: runstrip: &#39;arm-poky-linux-g=
nueabi-strip&#39; --remove-section=3D.comment --remove-section=3D.note &#39=
;/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsg=
i/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi&#39;<br>DEBUG: Pytho=
n function split_and_strip_files finished<br>DEBUG: Executing python functi=
on fixup_perms<br>DEBUG: Python function fixup_perms finished<br>DEBUG: Exe=
cuting python function package_do_split_locales<br>DEBUG: No locale files i=
n this package<br>DEBUG: Python function package_do_split_locales finished<=
br>DEBUG: Executing python function populate_packages<br>DEBUG: Python func=
tion populate_packages finished<br>DEBUG: Executing python function do_pack=
age_qa<br>NOTE: DO PACKAGE QA<br>NOTE: Checking Package: uwsgi-staticdev<br=
>NOTE: Checking Package: uwsgi-dev<br>NOTE: Checking Package: uwsgi-dbg<br>=
NOTE: arm-poky-linux-gnueabi-objdump -p /media/Build/master/build/tmp/work/=
armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/pac=
kages-split/uwsgi-dbg/usr/bin/.debug/uwsgi<br>NOTE: Checking Package: uwsgi=
-doc<br>NOTE: Checking Package: uwsgi<br>NOTE: arm-poky-linux-gnueabi-objdu=
mp -p /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi=
/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi<br=
>ERROR: QA Issue: package uwsgi contains bad RPATH /media/Build/master/buil=
d/tmp/sysroots/duovero/usr/lib in file /media/Build/master/build/tmp/work/a=
rmv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/pack=
ages-split/uwsgi/usr/bin/uwsgi<br>ERROR: QA run found fatal errors. Please =
consider fixing them.<br>DEBUG: Python function do_package_qa finished<br>D=
EBUG: Python function do_package finished<br>ERROR: Function failed: do_pac=
kage_qa</blockquote></div><div><br></div></div>

--bcaec547c5e5444c400504501e47--
