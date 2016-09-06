Return-Path: <aliaksei.karnavushanka@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6C96E00F8F; Tue,  6 Sep 2016 09:15:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aliaksei.karnavushanka[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CA5CE00D31
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Sep 2016 09:15:27 -0700 (PDT)
Received: by mail-yb0-f170.google.com with SMTP id g5so25413941yba.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Sep 2016 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=T1ps2fYyvF3AfX5JMTPpmGMlNrQGkJ5NGHx57XBD9xg=;
	b=x47l//NPJf+Qspqs45bOlw3TuZE2wy/cLBY8YnC3db7XFRQsElb8O+zDkQsrNhRpga
	hr7VZcBhRv7M11X37+qyUleVz89/V32A7IsjAbxPPkd0EffIyhL8vsSMhy3qtI3BY96O
	ktpF395leuC9HQyaue2m3G1eyUIe5Mhiwa3uETaIMPj5k1gAhld8eaQL9WnSX0Vo0lcF
	57dhqL4TpDs1LNkfjS1IphMK5/XLYZCvDa3V2WZEKAMH+HCzcAhyMqLkUuvfZzxN9Fm6
	I3ANYHmGIbHSasHBJfp98x0oJRbmICyiCM6YUVg6g3T3j7AhyToEOw/rHNJtOfa+MeED
	vHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=T1ps2fYyvF3AfX5JMTPpmGMlNrQGkJ5NGHx57XBD9xg=;
	b=ilnj54svXEq2Z6MU5oSn8bvTzMIuKl8c6zV8jKi4ERYUktgQnCSiU4MbyS+sOsKNhW
	mS/QdfeCQeP91bzx01RcCORAE1iyol7yqiz1xYNIr6FIEg/ns1g5xzpxjK9Mlr5AKvFy
	970WoUm7pQueDef2lyJF1tLug5q2FLW62hx8SpnuFbVClMWyMNNzEez+TsmT1eltK7El
	ThoIiozeZMZkPJoTU5znxYaZcQGPRmKFcMzQ0ziT1cAw9K/QPxmOghLUmz4j9w/mTf8+
	KOLSUinf73NRvJbZzgHxM9jioSzyrMI7GlmxjhlcANS0UNGc/WW7Fv48dJN87QoEO1gU
	657g==
X-Gm-Message-State: AE9vXwPLgZRruxE3b2/SEnrzDYoVA1M1bO6ye4tZD6u/FHVRJVUU2B4plmqQK+Vu/U+FImIkHSCquZ3p0bnMLA==
X-Received: by 10.36.99.2 with SMTP id j2mr29064335itc.72.1473178526394; Tue,
	06 Sep 2016 09:15:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.93.100 with HTTP; Tue, 6 Sep 2016 09:15:25 -0700 (PDT)
From: Aliaksei Karnavushanka <aliaksei.karnavushanka@gmail.com>
Message-ID: <CAOFUUjtvZWzY5DxPXO62R6LXDMwxr_q2JxfFf4wzy6oCm4NQ_A@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:38 -0800
Subject: Can't build xen-image-minimal with meta-virtualization layer for generic86_64 platform
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
Date: Tue, 06 Sep 2016 16:15:51 -0000
X-Original-Date: Tue, 6 Sep 2016 19:15:25 +0300
X-List-Received-Date: Tue, 06 Sep 2016 16:15:51 -0000
Content-Type: multipart/alternative; boundary=001a113acda0c1afe4053bd91a6c

--001a113acda0c1afe4053bd91a6c
Content-Type: text/plain; charset=UTF-8

Hi! I'm trying to build xen-image-minimal for generic86_64 platform under
my Ubuntu 14.04. Unfortunately when it comes to meta-virtualization layer,
build process crashes with the following error:

DEBUG: Executing python function do_rootfs
NOTE: configuring RPM platform settings
NOTE: configuring RPM system provides
NOTE: configuring RPM DB settings
NOTE: configuring Smart settings
NOTE: Note: adding Smart channel genericx86_64 (35)
NOTE: Note: adding Smart channel core2_64 (30)
NOTE: Note: adding Smart channel all (25)
NOTE: adding Smart RPM DB channel
NOTE: Note: configuring RPM cross-install scriptlet_wrapper
NOTE: ###### Generate rootfs #######
NOTE: Executing
'/home/alex/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/createrepo
--dbpath /home/alex/work/yocto/poky/build/tmp/work/genericx86_64-
poky-linux/xen-image-minimal/1.0-r0/rpmdb/all --update -q
/home/alex/work/yocto/poky/build/tmp/deploy/rpm/all' ...
NOTE: Executing
'/home/alex/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/createrepo
--dbpath /home/alex/work/yocto/poky/build/tmp/work/genericx86_64-
poky-linux/xen-image-minimal/1.0-r0/rpmdb/core2_64 --update -q
/home/alex/work/yocto/poky/build/tmp/deploy/rpm/core2_64' ...
NOTE: Executing
'/home/alex/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/createrepo
--dbpath /home/alex/work/yocto/poky/build/tmp/work/genericx86_64-
poky-linux/xen-image-minimal/1.0-r0/rpmdb/genericx86_64 --update -q
/home/alex/work/yocto/poky/build/tmp/deploy/rpm/genericx86_64' ...
NOTE: Installing the following packages: kernel-module-xen-netback
kernel-module-xen-gntalloc run-postinsts kernel-module-xen-acpi-processor
mc packagegroup-core-ssh-openssh kernel-module-xen-pciback
kernel-module-xen-blkback kernel-module-xen-gntdev qemu xen-base
packagegroup-core-boot kernel-module-xen-wdt locale-base-en-us
locale-base-en-gb
NOTE: Not found kernel-module-xen-netback by name, searching provides ...
NOTE: cmd: /home/alex/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/smart
--log-level=warning --data-dir=/home/alex/work/yocto/poky/build/tmp/work/
genericx86_64-poky-linux/xen-image-minimal/1.0-r0/rootfs/var/lib/smart
query --provides kernel-module-xen-netback --show-format='$name-$version' |
sed -ne 's/ *Provides://p'







*ERROR: kernel-module-xen-netback not found in the base feeds
(genericx86_64 core2-64 x86_64 noarch any all).....DEBUG: Python function
do_rootfs finishedERROR: Function failed: do_rootfs*
But if i delete * kernel-module-xen-netback *from the IMAGE_INSTALL list in
config file for this image (xen-image-minimal.bb) everything works fine. So
could you help me to locate the source of this error? Is it a layer bug or
something else?

Best regards,
Aliaksei.

--001a113acda0c1afe4053bd91a6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi! I&#39;m trying to build xen-image-minim=
al for generic86_64 platform under my Ubuntu 14.04. Unfortunately when it c=
omes to meta-virtualization layer, build process crashes with the following=
 error:<br><br>DEBUG: Executing python function do_rootfs<br>NOTE: configur=
ing RPM platform settings<br>NOTE: configuring RPM system provides<br>NOTE:=
 configuring RPM DB settings<br>NOTE: configuring Smart settings<br>NOTE: N=
ote: adding Smart channel genericx86_64 (35)<br>NOTE: Note: adding Smart ch=
annel core2_64 (30)<br>NOTE: Note: adding Smart channel all (25)<br>NOTE: a=
dding Smart RPM DB channel<br>NOTE: Note: configuring RPM cross-install scr=
iptlet_wrapper<br>NOTE: ###### Generate rootfs #######<br>NOTE: Executing &=
#39;/home/alex/work/yocto/poky/<wbr>build/tmp/sysroots/x86_64-<wbr>linux/us=
r/bin/createrepo --dbpath /home/alex/work/yocto/poky/<wbr>build/tmp/work/ge=
nericx86_64-<wbr>poky-linux/xen-image-minimal/<wbr>1.0-r0/rpmdb/all --updat=
e -q /home/alex/work/yocto/poky/<wbr>build/tmp/deploy/rpm/all&#39; ...<br>N=
OTE: Executing &#39;/home/alex/work/yocto/poky/<wbr>build/tmp/sysroots/x86_=
64-<wbr>linux/usr/bin/createrepo --dbpath /home/alex/work/yocto/poky/<wbr>b=
uild/tmp/work/genericx86_64-<wbr>poky-linux/xen-image-minimal/<wbr>1.0-r0/r=
pmdb/core2_64 --update -q /home/alex/work/yocto/poky/<wbr>build/tmp/deploy/=
rpm/core2_64&#39; ...<br>NOTE: Executing &#39;/home/alex/work/yocto/poky/<w=
br>build/tmp/sysroots/x86_64-<wbr>linux/usr/bin/createrepo --dbpath /home/a=
lex/work/yocto/poky/<wbr>build/tmp/work/genericx86_64-<wbr>poky-linux/xen-i=
mage-minimal/<wbr>1.0-r0/rpmdb/genericx86_64 --update -q /home/alex/work/yo=
cto/poky/<wbr>build/tmp/deploy/rpm/<wbr>genericx86_64&#39; ...<br>NOTE: Ins=
talling the following packages: kernel-module-xen-netback kernel-module-xen=
-gntalloc run-postinsts kernel-module-xen-acpi-<wbr>processor mc packagegro=
up-core-ssh-openssh kernel-module-xen-pciback kernel-module-xen-blkback ker=
nel-module-xen-gntdev qemu xen-base packagegroup-core-boot kernel-module-xe=
n-wdt locale-base-en-us locale-base-en-gb<br>NOTE: Not found kernel-module-=
xen-netback by name, searching provides ...<br>NOTE: cmd: /home/alex/work/y=
octo/poky/<wbr>build/tmp/sysroots/x86_64-<wbr>linux/usr/bin/smart --log-lev=
el=3Dwarning --data-dir=3D/home/alex/work/<wbr>yocto/poky/build/tmp/work/<w=
br>genericx86_64-poky-linux/xen-<wbr>image-minimal/1.0-r0/rootfs/<wbr>var/l=
ib/smart query --provides kernel-module-xen-netback --show-format=3D&#39;$n=
ame-$version&#39; | sed -ne &#39;s/ *Provides://p&#39;<br><b>ERROR: kernel-=
module-xen-netback not found in the base feeds (genericx86_64 core2-64 x86_=
64 noarch any all).<br><br>....<br><br>DEBUG: Python function do_rootfs fin=
ished<br>ERROR: Function failed: do_rootfs<br><br></b></div>But if i delete=
 <b> kernel-module-xen-netback </b>from the IMAGE_INSTALL list in config fi=
le for this image (<a href=3D"http://xen-image-minimal.bb">xen-image-minima=
l.bb</a>) everything works fine. So could you help me to locate the source =
of this error? Is it a layer bug or something else?<br><br></div>Best regar=
ds,<br></div>Aliaksei.<br></div>

--001a113acda0c1afe4053bd91a6c--
