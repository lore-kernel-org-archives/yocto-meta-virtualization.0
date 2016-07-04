Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0FA1E00D0C; Sun,  3 Jul 2016 21:27:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93A6BE00CF0
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Jul 2016 21:27:31 -0700 (PDT)
Received: by mail-qt0-f173.google.com with SMTP id w59so82931090qtd.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 03 Jul 2016 21:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6kECNBMoAw8mjISy/O3stGYkaehgq6++SP2c/XEMqec=;
	b=Bi990DDPxlwz6NRGR8yQTSJWxLaAbUyQIa9XU+1AYoiL60RbfbNCbHZvUlKlm7Ecca
	l1YkGJlRryQiQc1sxfHOrdn62mSdgsVNc4fFOqantsvNbEh40kyO/laQDf3MnAifl6Tr
	Zk784XAMPx1vBEWUKaAOI950LAjikZV9MLlmZVCcsCDYkWAVVD5/C5s8u0hr+zednhAf
	sXE9Pl+NQxqV8UZfnNwpZz07arcZEAzcIgtyzmEphbHxU8Y8k1+G94KhOv2tsyo3PElA
	WRr+/cHJz3QTcfB1aq0wffVwwY6L3b2uyFbAsk1CRU2KxDGdUJEb/td5dqSrmXI2dW8i
	rM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6kECNBMoAw8mjISy/O3stGYkaehgq6++SP2c/XEMqec=;
	b=JUmllIvog4rd5dKgG456JCqroZExQzQsESoZfqLroP3g4zxKOfQr/EIR0IvIZj+Mfe
	4JQ9Aev0V231s4LwzBPREDMSjbpDtZoD3Y4O7Fhh5ScUeO8t8cLtSsS5NP+6Yk0QUF1t
	oIe4NY9lrNwkJV1ClHLywhGHJqZEw1BMLij4L5h480pUHETVH1nk/HWYiaYN5y+V+hmV
	OYJkInrZ7rtGaN7lJ2pRfPclTcCniB3SsrP+3piUrcK+AVf2vVaXTKkUkXHMvcUTAdzA
	ZSON0XUH/yEM/xiHqPojaj/p1bLs1ZBP1fcC9LWwpNrTrg40/24wur6SF3QdFAOjeNL4
	h41g==
X-Gm-Message-State: ALyK8tKysKxWWjTr9jPKi7jjPQLf5cnOFDmtQ7K1SeZNw5p4kSv+w8ZbwdToM/Lr6P/bBhkCTRU2rd1ZWxFNRA==
X-Received: by 10.200.39.150 with SMTP id w22mr15386662qtw.78.1467606450350;
	Sun, 03 Jul 2016 21:27:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Sun, 3 Jul 2016 21:27:29 -0700 (PDT)
In-Reply-To: <1467154441-11012-1-git-send-email-collin.richards@ni.com>
References: <1467154441-11012-1-git-send-email-collin.richards@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Jul 2016 00:27:29 -0400
Message-ID: <CADkTA4OjuSv5KrOvK85PHheNr761PGqdTaTteSvJzhJW7cr5Xw@mail.gmail.com>
To: Collin Richards <collin.richards@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-salttesting: Add ptest output format patch
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
X-List-Received-Date: Mon, 04 Jul 2016 04:27:35 -0000
Content-Type: multipart/alternative; boundary=001a114107ba24afc50536c7c1b2

--001a114107ba24afc50536c7c1b2
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Jun 28, 2016 at 6:54 PM, Collin Richards <collin.richards@ni.com>
wrote:

> Add a patch that allows the output of running the salt test suite to be
> in ptest format.
>
> Signed-off-by: Collin Richards <collin.richards@ni.com>
> Natinst-ReviewBoard-ID: 143279
> ---
>  ...001-Add-ptest-output-option-to-test-suite.patch | 232
> +++++++++++++++++++++
>  .../python/python-salttesting_2015.2.16.bb         |   6 +-
>  2 files changed, 237 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
>
> diff --git
> a/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> new file mode 100644
> index 0000000..c297320
> --- /dev/null
> +++
> b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
> @@ -0,0 +1,232 @@
> +From 7e2642530bfd4ac0226b90404e7a4511e44756b6 Mon Sep 17 00:00:00 2001
> +From: Collin Richards <collin.richards@ni.com>
> +Date: Tue, 28 Jun 2016 16:02:22 -0500
> +Subject: [PATCH] Add ptest output option to test suite
> +
> +Extend salttesting to support outputing the results of running the test
> +suite in ptest format.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Collin Richards <collin.richards@ni.com>
> +Natinst-ReviewBoard-ID: 143279
> +---
> + salttesting/parser/__init__.py |  12 +++
> + salttesting/ptest.py           | 168
> +++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 180 insertions(+)
> + create mode 100644 salttesting/ptest.py
> +
> +diff --git a/salttesting/parser/__init__.py
> b/salttesting/parser/__init__.py
> +index
> 1e7275b4b65ef29deb89049a70bf6a074e11873d..d8cba0cb1e4814b7065b6896186c25300048ec92
> 100644
> +--- a/salttesting/parser/__init__.py
> ++++ b/salttesting/parser/__init__.py
> +@@ -25,6 +25,7 @@ from functools import partial
> + from contextlib import closing
> +
> + from salttesting import TestLoader, TextTestRunner
> ++from salttesting.ptest import PTestRunner
> + from salttesting.version import __version_info__
> + from salttesting.xmlunit import HAS_XMLRUNNER, XMLTestRunner
> + try:
> +@@ -264,6 +265,12 @@ class SaltTestingParser(optparse.OptionParser):
> +             action='store_true',
> +             help='Do NOT show the overall tests result'
> +         )
> ++        self.output_options_group.add_option(
> ++            '--ptest-out',
> ++            dest='ptest_out',
> ++            default=False,
> ++            help='Output test results in PTest format'
> ++        )
> +         self.add_option_group(self.output_options_group)
> +
> +         self.fs_cleanup_options_group = optparse.OptionGroup(
> +@@ -491,6 +498,11 @@ class SaltTestingParser(optparse.OptionParser):
> +                 verbosity=self.options.verbosity
> +             ).run(tests)
> +             self.testsuite_results.append((header, runner))
> ++        elif self.options.ptest_out:
> ++            runner = PTestRunner(
> ++                stream=sys.stdout,
> ++                verbosity=self.options.verbosity).run(tests)
> ++            self.testsuite_results.append((header, runner))
> +         else:
> +             runner = TextTestRunner(
> +                 stream=sys.stdout,
> +diff --git a/salttesting/ptest.py b/salttesting/ptest.py
> +new file mode 100644
> +index
> 0000000000000000000000000000000000000000..9780886bc8f9d400aab2e96a33b14af980e64315
> +--- /dev/null
> ++++ b/salttesting/ptest.py
> +@@ -0,0 +1,168 @@
> ++# -*- coding: utf-8 -*-
> ++
> ++"""
> ++Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
> ++2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights
> ++Reserved
> ++
> ++PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
> ++--------------------------------------------
> ++
> ++1. This LICENSE AGREEMENT is between the Python Software Foundation
> ++("PSF"), and the Individual or Organization ("Licensee") accessing and
> ++otherwise using this software ("Python") in source or binary form and
> ++its associated documentation.
> ++
> ++2. Subject to the terms and conditions of this License Agreement, PSF
> hereby
> ++grants Licensee a nonexclusive, royalty-free, world-wide license to
> reproduce,
> ++analyze, test, perform and/or display publicly, prepare derivative works,
> ++distribute, and otherwise use Python alone or in any derivative version,
> ++provided, however, that PSF's License Agreement and PSF's notice of
> copyright,
> ++i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008,
> 2009, 2010,
> ++2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights
> ++Reserved" are retained in Python alone or in any derivative version
> prepared by
> ++Licensee.
> ++
> ++3. In the event Licensee prepares a derivative work that is based on
> ++or incorporates Python or any part thereof, and wants to make
> ++the derivative work available to others as provided herein, then
> ++Licensee hereby agrees to include in any such work a brief summary of
> ++the changes made to Python.
> ++
> ++4. PSF is making Python available to Licensee on an "AS IS"
> ++basis.  PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
> ++IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
> ++DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
> ++FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
> ++INFRINGE ANY THIRD PARTY RIGHTS.
> ++
> ++5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
> ++FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
> ++A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
> ++OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
> ++
> ++6. This License Agreement will automatically terminate upon a material
> ++breach of its terms and conditions.
> ++
> ++7. Nothing in this License Agreement shall be deemed to create any
> ++relationship of agency, partnership, or joint venture between PSF and
> ++Licensee.  This License Agreement does not grant permission to use PSF
> ++trademarks or trade name in a trademark sense to endorse or promote
> ++products or services of Licensee, or any third party.
> ++
> ++8. By copying, installing or otherwise using Python, Licensee
> ++agrees to be bound by the terms and conditions of this License
> ++Agreement.
> ++
> ++Modified Version of Python's TextTestRunner
> ++"""
> ++
> ++import time
> ++import sys
> ++import string
> ++
> ++import unittest
> ++TestResult = unittest.TestResult
> ++
> ++
> ++class _WritelnDecorator(object):
> ++    """Used to decorate file-like objects with a handy 'writeln'
> method"""
> ++    def __init__(self, stream):
> ++        self.stream = stream
> ++
> ++    def __getattr__(self, attr):
> ++        if attr in ('stream', '__getstate__'):
> ++            raise AttributeError(attr)
> ++        return getattr(self.stream, attr)
> ++
> ++    def writeln(self, arg=None):
> ++        if arg:
> ++            self.write(arg)
> ++        self.write('\n')  # text-mode streams translate to \r\n if needed
> ++
> ++
> ++class _PTestResult(TestResult):
> ++    """A test result class that can print formatted text results to a
> stream.
> ++
> ++    Used by PTestRunner.
> ++    """
> ++    separator1 = '=' * 70
> ++    separator2 = '-' * 70
> ++
> ++    def __init__(self, stream, descriptions, verbosity):
> ++        TestResult.__init__(self)
> ++        self.stream = stream
> ++        self.showAll = verbosity > 1
> ++        self.dots = verbosity == 1
> ++        self.descriptions = descriptions
> ++
> ++    def getDescription(self, test):
> ++        if self.descriptions:
> ++            return test.shortDescription() or str(test)
> ++        else:
> ++            return str(test)
> ++
> ++    def startTest(self, test):
> ++        TestResult.startTest(self, test)
> ++
> ++    def addSuccess(self, test):
> ++        TestResult.addSuccess(self, test)
> ++        if self.showAll:
> ++            self.stream.writeln("PASS:
> {0}".format(self.getDescription(test)))
> ++        elif self.dots:
> ++            self.stream.write('.')
> ++
> ++    def addError(self, test, err):
> ++        TestResult.addError(self, test, err)
> ++        if self.showAll:
> ++            self.stream.writeln("FAIL: ERROR
> {0}".format(self.getDescription(test)))
> ++        elif self.dots:
> ++            self.stream.write('E')
> ++
> ++    def addFailure(self, test, err):
> ++        TestResult.addFailure(self, test, err)
> ++        if self.showAll:
> ++            self.stream.writeln("FAIL:
> {0}".format(self.getDescription(test)))
> ++        elif self.dots:
> ++            self.stream.write('F')
> ++
> ++    def printErrors(self):
> ++        if self.dots or self.showAll:
> ++            self.stream.writeln()
> ++        self.printErrorList('ERROR', self.errors)
> ++        self.printErrorList('FAIL', self.failures)
> ++
> ++    def printErrorList(self, flavour, errors):
> ++        for test, err in errors:
> ++            self.stream.writeln(self.separator1)
> ++            self.stream.writeln("{0}: {0}".format(flavour,
> self.getDescription(test)))
> ++            self.stream.writeln(self.separator2)
> ++            self.stream.writeln("{0}".format(err))
> ++
> ++
> ++class PTestRunner:
> ++    """A test runner class that displays results in PTest format.
> ++
> ++    """
> ++    def __init__(self, stream=sys.stderr, descriptions=1, verbosity=1):
> ++        self.stream = _WritelnDecorator(stream)
> ++        self.descriptions = descriptions
> ++        self.verbosity = 2
> ++
> ++    def _makeResult(self):
> ++        return _PTestResult(self.stream, self.descriptions,
> self.verbosity)
> ++
> ++    def run(self, test):
> ++        "Run the given test case or test suite."
> ++        result = self._makeResult()
> ++        startTime = time.time()
> ++        test(result)
> ++        stopTime = time.time()
> ++        timeTaken = float(stopTime - startTime)
> ++        result.printErrors()
> ++        run = result.testsRun
> ++        self.stream.writeln("Ran %d test%s in %.3fs" %
> ++                            (run, run == 1 and "" or "s", timeTaken))
> ++        self.stream.writeln(result.separator2)
> ++        self.stream.writeln()
> ++        return result
> +--
> +1.9.1
> +
> diff --git a/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb b/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb
> index 78ad879..2a5ed20 100644
> --- a/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb
> @@ -5,7 +5,11 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
>  SRCNAME = "salt-testing"
>
> -SRC_URI = "
> https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz
> "
> +FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
> +
> +SRC_URI = "
> https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz
> \
> +           file://0001-Add-ptest-output-option-to-test-suite.patch \
> +           "
>  SRC_URI[md5sum] = "8ca55a796e9ad7ba72bc143043753ccf"
>  SRC_URI[sha256sum] =
> "0ef4be6a8a9b505ae1c328394dfad50493674af6100c7e2c220f374533d86edc"
>
> --
> 1.9.1
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

--001a114107ba24afc50536c7c1b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 28, 2016 at 6:54 PM=
, Collin Richards <span dir=3D"ltr">&lt;<a href=3D"mailto:collin.richards@n=
i.com" target=3D"_blank">collin.richards@ni.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Add a patch that allows the output of running =
the salt test suite to be<br>
in ptest format.<br>
<br>
Signed-off-by: Collin Richards &lt;<a href=3D"mailto:collin.richards@ni.com=
">collin.richards@ni.com</a>&gt;<br>
Natinst-ReviewBoard-ID: 143279<br>
---<br>
=C2=A0...001-Add-ptest-output-option-to-test-suite.patch | 232 ++++++++++++=
+++++++++<br>
=C2=A0.../python/<a href=3D"http://python-salttesting_2015.2.16.bb" rel=3D"=
noreferrer" target=3D"_blank">python-salttesting_2015.2.16.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A02 files changed, 237 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-salt=
testing/0001-Add-ptest-output-option-to-test-suite.patch<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-salttesting/0001=
-Add-ptest-output-option-to-test-suite.patch b/meta-openstack/recipes-devto=
ols/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.pa=
tch<br>
new file mode 100644<br>
index 0000000..c297320<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-pt=
est-output-option-to-test-suite.patch<br>
@@ -0,0 +1,232 @@<br>
+From 7e2642530bfd4ac0226b90404e7a4511e44756b6 Mon Sep 17 00:00:00 2001<br>
+From: Collin Richards &lt;<a href=3D"mailto:collin.richards@ni.com">collin=
.richards@ni.com</a>&gt;<br>
+Date: Tue, 28 Jun 2016 16:02:22 -0500<br>
+Subject: [PATCH] Add ptest output option to test suite<br>
+<br>
+Extend salttesting to support outputing the results of running the test<br=
>
+suite in ptest format.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Collin Richards &lt;<a href=3D"mailto:collin.richards@ni.co=
m">collin.richards@ni.com</a>&gt;<br>
+Natinst-ReviewBoard-ID: 143279<br>
+---<br>
+ salttesting/parser/__init__.py |=C2=A0 12 +++<br>
+ salttesting/ptest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 168 ++++++=
+++++++++++++++++++++++++++++++++++<br>
+ 2 files changed, 180 insertions(+)<br>
+ create mode 100644 salttesting/ptest.py<br>
+<br>
+diff --git a/salttesting/parser/__init__.py b/salttesting/parser/__init__.=
py<br>
+index 1e7275b4b65ef29deb89049a70bf6a074e11873d..d8cba0cb1e4814b7065b689618=
6c25300048ec92 100644<br>
+--- a/salttesting/parser/__init__.py<br>
++++ b/salttesting/parser/__init__.py<br>
+@@ -25,6 +25,7 @@ from functools import partial<br>
+ from contextlib import closing<br>
+<br>
+ from salttesting import TestLoader, TextTestRunner<br>
++from salttesting.ptest import PTestRunner<br>
+ from salttesting.version import __version_info__<br>
+ from salttesting.xmlunit import HAS_XMLRUNNER, XMLTestRunner<br>
+ try:<br>
+@@ -264,6 +265,12 @@ class SaltTestingParser(optparse.OptionParser):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0action=3D&#39;store_true&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;Do NOT show th=
e overall tests result&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.output_options_group.add_option(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--ptest-out&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest=3D&#39;ptest_out&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default=3DFalse,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Output test results=
 in PTest format&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.add_option_group(self.output_option=
s_group)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fs_cleanup_options_group =3D optpar=
se.OptionGroup(<br>
+@@ -491,6 +498,11 @@ class SaltTestingParser(optparse.OptionParser):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0verbosity=3D=
self.options.verbosity<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0).run(tests)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.testsuite_results.app=
end((header, runner))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.options.ptest_out:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 runner =3D PTestRunner(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream=3Dsys.stdo=
ut,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verbosity=3Dself.=
options.verbosity).run(tests)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.testsuite_results.append((=
header, runner))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runner =3D TextTestRunner(=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stream=3Dsys=
.stdout,<br>
+diff --git a/salttesting/ptest.py b/salttesting/ptest.py<br>
+new file mode 100644<br>
+index 0000000000000000000000000000000000000000..9780886bc8f9d400aab2e96a33=
b14af980e64315<br>
+--- /dev/null<br>
++++ b/salttesting/ptest.py<br>
+@@ -0,0 +1,168 @@<br>
++# -*- coding: utf-8 -*-<br>
++<br>
++&quot;&quot;&quot;<br>
++Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,=
<br>
++2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights=
<br>
++Reserved<br>
++<br>
++PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2<br>
++--------------------------------------------<br>
++<br>
++1. This LICENSE AGREEMENT is between the Python Software Foundation<br>
++(&quot;PSF&quot;), and the Individual or Organization (&quot;Licensee&quo=
t;) accessing and<br>
++otherwise using this software (&quot;Python&quot;) in source or binary fo=
rm and<br>
++its associated documentation.<br>
++<br>
++2. Subject to the terms and conditions of this License Agreement, PSF her=
eby<br>
++grants Licensee a nonexclusive, royalty-free, world-wide license to repro=
duce,<br>
++analyze, test, perform and/or display publicly, prepare derivative works,=
<br>
++distribute, and otherwise use Python alone or in any derivative version,<=
br>
++provided, however, that PSF&#39;s License Agreement and PSF&#39;s notice =
of copyright,<br>
++i.e., &quot;Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008,=
 2009, 2010,<br>
++2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights=
<br>
++Reserved&quot; are retained in Python alone or in any derivative version =
prepared by<br>
++Licensee.<br>
++<br>
++3. In the event Licensee prepares a derivative work that is based on<br>
++or incorporates Python or any part thereof, and wants to make<br>
++the derivative work available to others as provided herein, then<br>
++Licensee hereby agrees to include in any such work a brief summary of<br>
++the changes made to Python.<br>
++<br>
++4. PSF is making Python available to Licensee on an &quot;AS IS&quot;<br>
++basis.=C2=A0 PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR<br>
++IMPLIED.=C2=A0 BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND<br=
>
++DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS<br=
>
++FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT<br>
++INFRINGE ANY THIRD PARTY RIGHTS.<br>
++<br>
++5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON<br>
++FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS<br>
++A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,<br>
++OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.<br=
>
++<br>
++6. This License Agreement will automatically terminate upon a material<br=
>
++breach of its terms and conditions.<br>
++<br>
++7. Nothing in this License Agreement shall be deemed to create any<br>
++relationship of agency, partnership, or joint venture between PSF and<br>
++Licensee.=C2=A0 This License Agreement does not grant permission to use P=
SF<br>
++trademarks or trade name in a trademark sense to endorse or promote<br>
++products or services of Licensee, or any third party.<br>
++<br>
++8. By copying, installing or otherwise using Python, Licensee<br>
++agrees to be bound by the terms and conditions of this License<br>
++Agreement.<br>
++<br>
++Modified Version of Python&#39;s TextTestRunner<br>
++&quot;&quot;&quot;<br>
++<br>
++import time<br>
++import sys<br>
++import string<br>
++<br>
++import unittest<br>
++TestResult =3D unittest.TestResult<br>
++<br>
++<br>
++class _WritelnDecorator(object):<br>
++=C2=A0 =C2=A0 &quot;&quot;&quot;Used to decorate file-like objects with a=
 handy &#39;writeln&#39; method&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 def __init__(self, stream):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream =3D stream<br>
++<br>
++=C2=A0 =C2=A0 def __getattr__(self, attr):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if attr in (&#39;stream&#39;, &#39;__getstate=
__&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AttributeError(attr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return getattr(self.stream, attr)<br>
++<br>
++=C2=A0 =C2=A0 def writeln(self, arg=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if arg:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write(arg)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write(&#39;\n&#39;)=C2=A0 # text-mode st=
reams translate to \r\n if needed<br>
++<br>
++<br>
++class _PTestResult(TestResult):<br>
++=C2=A0 =C2=A0 &quot;&quot;&quot;A test result class that can print format=
ted text results to a stream.<br>
++<br>
++=C2=A0 =C2=A0 Used by PTestRunner.<br>
++=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 separator1 =3D &#39;=3D&#39; * 70<br>
++=C2=A0 =C2=A0 separator2 =3D &#39;-&#39; * 70<br>
++<br>
++=C2=A0 =C2=A0 def __init__(self, stream, descriptions, verbosity):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestResult.__init__(self)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream =3D stream<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.showAll =3D verbosity &gt; 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dots =3D verbosity =3D=3D 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.descriptions =3D descriptions<br>
++<br>
++=C2=A0 =C2=A0 def getDescription(self, test):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.descriptions:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return test.shortDescription() =
or str(test)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return str(test)<br>
++<br>
++=C2=A0 =C2=A0 def startTest(self, test):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestResult.startTest(self, test)<br>
++<br>
++=C2=A0 =C2=A0 def addSuccess(self, test):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestResult.addSuccess(self, test)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.showAll:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(&quot;PASS:=
 {0}&quot;.format(self.getDescription(test)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.dots:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.write(&#39;.&#39;)<=
br>
++<br>
++=C2=A0 =C2=A0 def addError(self, test, err):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestResult.addError(self, test, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.showAll:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(&quot;FAIL:=
 ERROR {0}&quot;.format(self.getDescription(test)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.dots:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.write(&#39;E&#39;)<=
br>
++<br>
++=C2=A0 =C2=A0 def addFailure(self, test, err):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestResult.addFailure(self, test, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.showAll:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(&quot;FAIL:=
 {0}&quot;.format(self.getDescription(test)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.dots:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.write(&#39;F&#39;)<=
br>
++<br>
++=C2=A0 =C2=A0 def printErrors(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.dots or self.showAll:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.printErrorList(&#39;ERROR&#39;, self.err=
ors)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.printErrorList(&#39;FAIL&#39;, self.fail=
ures)<br>
++<br>
++=C2=A0 =C2=A0 def printErrorList(self, flavour, errors):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for test, err in errors:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(self.separa=
tor1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(&quot;{0}: =
{0}&quot;.format(flavour, self.getDescription(test)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(self.separa=
tor2)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(&quot;{0}&q=
uot;.format(err))<br>
++<br>
++<br>
++class PTestRunner:<br>
++=C2=A0 =C2=A0 &quot;&quot;&quot;A test runner class that displays results=
 in PTest format.<br>
++<br>
++=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 def __init__(self, stream=3Dsys.stderr, descriptions=3D1, v=
erbosity=3D1):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream =3D _WritelnDecorator(stream)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.descriptions =3D descriptions<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.verbosity =3D 2<br>
++<br>
++=C2=A0 =C2=A0 def _makeResult(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return _PTestResult(self.stream, self.descrip=
tions, self.verbosity)<br>
++<br>
++=C2=A0 =C2=A0 def run(self, test):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Run the given test case or test suite.&=
quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D self._makeResult()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 startTime =3D time.time()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test(result)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 stopTime =3D time.time()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 timeTaken =3D float(stopTime - startTime)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 result.printErrors()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 run =3D result.testsRun<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(&quot;Ran %d test%s in %.=
3fs&quot; %<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (run, run =3D=3D 1 and &quot;&quot; or &quot;s&quo=
t;, timeTaken))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln(result.separator2)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.stream.writeln()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return result<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-salttesting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python-sal=
ttesting_2015.2.16.bb</a> b/meta-openstack/recipes-devtools/python/<a href=
=3D"http://python-salttesting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_b=
lank">python-salttesting_2015.2.16.bb</a><br>
index 78ad879..2a5ed20 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-saltt=
esting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python-salttestin=
g_2015.2.16.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-saltt=
esting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python-salttestin=
g_2015.2.16.bb</a><br>
@@ -5,7 +5,11 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df36f1e9e3e30f90180efd=
f7e40d943e5&quot;<br>
=C2=A0SRCNAME =3D &quot;salt-testing&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/saltstack/salt-testing/arc=
hive/v${PV}.tar.gz;downloadfilename=3Dsalt-testing-v${PV}.tar.gz" rel=3D"no=
referrer" target=3D"_blank">https://github.com/saltstack/salt-testing/archi=
ve/v${PV}.tar.gz;downloadfilename=3Dsalt-testing-v${PV}.tar.gz</a>&quot;<br=
>
+FILESEXTRAPATHS_append :=3D &quot;${THISDIR}/${PN}&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/saltstack/salt-testing/arc=
hive/v${PV}.tar.gz;downloadfilename=3Dsalt-testing-v${PV}.tar.gz" rel=3D"no=
referrer" target=3D"_blank">https://github.com/saltstack/salt-testing/archi=
ve/v${PV}.tar.gz;downloadfilename=3Dsalt-testing-v${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-ptest-output-opti=
on-to-test-suite.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;8ca55a796e9ad7ba72bc143043753ccf&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;0ef4be6a8a9b505ae1c328394dfad50493674af6=
100c7e2c220f374533d86edc&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a114107ba24afc50536c7c1b2--
