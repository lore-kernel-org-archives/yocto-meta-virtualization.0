Return-Path: <edwingate8@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D1BEE00D08; Wed, 30 Sep 2015 11:10:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (edwingate8[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63755E006D5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Sep 2015 11:10:40 -0700 (PDT)
Received: by labzv5 with SMTP id zv5so56554582lab.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Sep 2015 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QDS4VxDKVyqTFWExDVG0S+Dj7O+c25ELG9GtUCDz7BU=;
	b=lXUoSkNtRa49vJaB8cGtzMQpkz7ZvVozQWKmGgXlUnAy/2sI5mMBbuRXOBdAjIRWgc
	IvCds7ufEgtcp5sE1ebPpEllzoOW86lTUNP5e0osZSJm7BUZnbM+jsbdRMKf8NfNgpkp
	dSI+JNXaVchR/6jNabymMDF6HpGMBpsWdBTyfX5/gJ5+powy+CFWcJn32rx66nEUDPMq
	Fx5gU6spdFCq+wicFryvwsUi2fhMzbtr8B2k5ZsPKTbc6bXSp0SflDG50ZRphpS2ePej
	0tPuclgjx47DX20ce7GSTG+hUFKuIPojk4dY+kNMN312QPC2M0QeMIo+f1Y3kBK7ThpU
	ERDg==
MIME-Version: 1.0
X-Received: by 10.25.16.195 with SMTP id 64mr997650lfq.39.1443636639113; Wed,
	30 Sep 2015 11:10:39 -0700 (PDT)
Received: by 10.114.245.38 with HTTP; Wed, 30 Sep 2015 11:10:39 -0700 (PDT)
Date: Wed, 30 Sep 2015 11:10:39 -0700
Message-ID: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
From: Edward Wingate <edwingate8@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: python setuptools recipe
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
X-List-Received-Date: Wed, 30 Sep 2015 18:10:43 -0000
Content-Type: text/plain; charset=UTF-8

I'm trying to write a recipe to install the python module
gevent-socketio (http://pypi.python.org/pypi/gevent-socketio). I
created the typical setuptools inherited recipe and named it
python-gevent-socketio_0.3.6.bb:

DESCRIPTION = "Python gevent-socketio"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=13484d110cf0f7e0713493cb09a8601c"
RDEPENDS_${PN} += "python-gevent"
SRCNAME = "gevent-socketio"

SRC_URI = "http://pypi.python.org/packages/source/g/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
SRC_URI[md5sum] = "33f745d74885366a07da516c000854b6"
SRC_URI[sha256sum] =
"53394ab93fbd84d9dbbb2bef85349f6a503bfc53d86a9be8653250f1a0412aff"

S = "${WORKDIR}/${SRCNAME}-${PV}"

inherit setuptools

=====

But I get this error during do_compile:

Download error on http://pypi.python.org/simple/versiontools/: [SSL:
CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581) --
Some packages may not be found!
Download error on http://pypi.python.org/simple/versiontools/: [SSL:
CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581) --
Some packages may not be found!
Couldn't find index page for 'versiontools' (maybe misspelled?)
Download error on http://pypi.python.org/simple/: [SSL:
CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581) --
Some packages may not be found!
No local packages or download links found for versiontools>=1.7

The entire log is here: http://pastebin.com/Dz7NU7um

I have another recipe following this recipe template and it works OK.
I don't know what could be different about gevent-socketio.  Can
anyone help with this error?  I am able to wget
http://pypi.python.org/simple/versiontools and get valid response.
Thanks for any help.

