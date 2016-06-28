Return-Path: <collin.richards@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF4A9E00C6E; Tue, 28 Jun 2016 16:11:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [207.46.100.146 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 961 seconds by postgrey-1.32 at yocto-www;
	Tue, 28 Jun 2016 16:10:59 PDT
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0146.outbound.protection.outlook.com [207.46.100.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 688BBE00C44
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jun 2016 16:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lhimmXI/RPrjztH5iXtBF2lY6NRnyJGyyAxDWkXssLQ=;
	b=EMHTDPbBTBX23FLiF36ngoVcaJ5RIEPXn6xMtt9mPY6i9w4L2rkJ48QA+/VqMSyh3zurDp5+AHQLP4sR9CR+BNtgPpH9mmCqHHHhIrBqe6LCO5OmneHFu7hIYGTOYg5vYWeE1+9TosAQAqkpP+nfiZvvx8FMnxJKs+XDqhtj6S0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=collin.richards@ni.com; 
Received: from titan.amer.corp.natinst.com (130.164.62.220) by
	BL2PR04MB2049.namprd04.prod.outlook.com (10.167.98.11) with Microsoft
	SMTP Server (TLS) id 15.1.523.12; Tue, 28 Jun 2016 22:54:54 +0000
From: Collin Richards <collin.richards@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 28 Jun 2016 17:54:01 -0500
Message-ID: <1467154441-11012-1-git-send-email-collin.richards@ni.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [130.164.62.220]
X-ClientProxiedBy: YQXPR01CA0071.CANPRD01.PROD.OUTLOOK.COM (10.165.103.39) To
	BL2PR04MB2049.namprd04.prod.outlook.com (10.167.98.11)
X-MS-Office365-Filtering-Correlation-Id: bfb101ac-4d83-4f0d-5600-08d39fa738ed
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB2049;
	2:XlRooeSAdeWnExMzoGXJ+UBSAbO4BPYy/spMu4s//b4HsFqic65mrivzpPqDa6X2ApABtiM4hLwaqMszdvKdhZJETsnwWrs00t1CcTvV5FLAKDOY2y/cXMhImt948t8N85xtX3Qf/Fykkoymn0veLftVmCozYl6wKgaS0gJUT6uKwRRF4UBsnrS2uKVMiwJB;
	3:vMq+RegyuH4V0GXSDpZ5ZOy2+msqEqyMMMOyAILjSBinxy8C52lUvl4ETJspzzEq22llaDelp9WZkvMeqo3vYHJjAj3uds6HrToO6jA4lEnH1Z/nZpBiNekI6emvY/IE
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB2049;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB2049;
	25:FM0S11tGh5oQPsffW7c6pfJAaeWhUIQrkaG71wITHTiFyf8YZzPIuXxWf/ByvuO8Jt3gBgUCI+jZZGUF3tfA2Smsi/NJQ5kZwv7+BrZf/Y55j15tcp4VG+4h/xCUhOIF6PKYxq6R4FvPIwtgfNH+lMz+pLsZvtEc5IGM7yrn/oZ4rQS0FYhq0afoiTyxo0Gr6KPX1ekSsPQLK3xtUArClNxFq/5w9S4VMSjtjfvTo8Az54wqaAAYGS/gmhF56OcTzY5+gDCi5r8EPperRdDGZ33X06gDfjLlOmEHER6eFTQrYJSWDTNrHv8aLEdPlFlQr3++FijyGsqw40ofs2JW2eOpZmMw2d/RaxDTOuEC++KTpH+XVTH952DpgIAm+mFVK+BbnQfiV7qVHGvwqB9+S17/b8mEGQXQ0XNnR9/5M2kk1t/0kDuF8KwurqulpnzpZYsehctgOuKPtbhTDtxOssgERaVY0bKCOLyXHhBG3pJTLFExuOiO6cS2AJscE9skbnm+Xs57zZ/IcAFrp1nUcU193QanC8ka8R19h/UcorhvOjscnDnMv+FwAli0vrDOe7mAas4rGegJkG1ZPoH06QfBe584j6oI/bEjJbpgu4j3HGwugT4LmI8S/UF2L8hWzp2IfHOG19qhjbJvHsCzSmkZtL4mcIMrGEyJa2+Zyt9O5k+Z0ouOar3Mdkz98Xjt6RQxuR0Fx68TtxtFoLM7ytDZ7og1AsWiNNKADMV+KL5BrL83Sq4yMWzs4yaQScIuGS8TSrG1+T4XuXj3j7Rvg94lcBfcVND0KdJBUNjwFQauifSApDkio/Qy+I4eN7oKrMowf6CHdmxCvzdEVWX5QpbUSl4/5lXZltl9cevjWAh9XK91uvQ++jGSzcAvpMxv
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB2049;
	20:Vhb+WLCzwS17b6ttH9IQEmYeS0JQE6Y1X/wuLHxtQbyDo1ZO7w/BegYwg3D+a2K6Q4L+9jIjz6VJP4Wd1A85bEGKZBN+weTtYunOirwXXwXKW8C6+jXDfO92NN2T2QACIqzsXR9TlexfMAE2GYIAX9ET8RrfOEJ7LFhRT7Lmg0G99IJdD5sqiOASJFqRcT5K2zprA7wPhTbQRkoG07Lf/KjrKiz3tci4JwAi5t3lvSl+mnJgVpFmQSLUFkzdzu/44f5QKg6DNs2JshLhYclNcPsPZdwkMCnQ1YobQhui2aSMizr8l2ubX+hvMumtVVPQtPDBsf7UMWq7mEHx1qfmFuPMBAUppWjCkzGGMpDOfK0Qr63ODo9pbwfQ+sVZR6J5L4vEWcQQaJzeRwH1JC8hXTIvJCUR90ACXBU3snoGcE3RBHpH0l03+GmoT9AaLx+Y8+kLzLFh3FdKpfNbDD5YVafhxsEkDWUJc2R6ML+WTp/1g2RDCTinNIU1a67YeRblevpZKQ1zAsOdpuxsOUB5NooaAtAxFTYmBKuXJcs/N6VNfu/KBtQ9mMMbPF0I/7E04AqotW1gP2qS2FaAuJV90LbkCJD82FsTOEztZakyPLs=
X-Microsoft-Antispam-PRVS: <BL2PR04MB204922110C796261766116B983220@BL2PR04MB2049.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BL2PR04MB2049; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB2049; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB2049;
	4:B0nAocLLnnU0TwsytWM5MpnWulyb70bO8pZ7y6W3W0IPE3BZWhfaLW4uYVWrls4rQ61x0jLKwglxDuxNwM+EsSnseBsUtvESzK11PsCGXx5/xM07bD9hl0+KnR9UQqKnjuO3BXmfFb9Imm7T2WA1PnXaySDgYTYMA2vEIiq8quYKwEoTBdbmOnD10TkoY/OHSaQuOgsayt98amex6cOdiUaq6MQMBbet/Mbl3dY6DcameB0AEd6OzDk+F4txbUHsycUhYbFkZa9YyQgZUnT1zIs0TqQ1VYEiVDODOrh5SGCFyLjo5xKIvDhgqnJdPVLyLcsFiHL32GSykioFB8rNCkmN7/QYbA4k9UO9wz+ZX30VXv9WK4pz7JBVGy3+MTZuDdqrUVJrZA3w22X8nuTLGTvHf253w+vx2lHgpB1xme3Zuyra/PgCpzkOWzQz8Nkh
X-Forefront-PRVS: 0987ACA2E2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(979002)(6009001)(7916002)(199003)(189002)(4326007)(50986999)(450100001)(50466002)(77096005)(92566002)(97736004)(2351001)(19580405001)(48376002)(50226002)(101416001)(36756003)(19580395003)(7846002)(68736007)(8676002)(86362001)(189998001)(575784001)(47776003)(7736002)(66066001)(586003)(3846002)(33646002)(6116002)(105586002)(106356001)(305945005)(110136002)(15975445007)(5003940100001)(229853001)(81166006)(81156014)(2906002)(42186005)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB2049;
	H:titan.amer.corp.natinst.com; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR04MB2049;
	23:F/68K+88wnXNOKNEnZHZsBaa0gJmRNdDMu53Wky1+?=
	=?us-ascii?Q?xn0Uv+WxrCwXNlXLJc2B5fQMaYeZnHgKK5NoIM5nMaPdH/zQ7gk0M0TJ4bea?=
	=?us-ascii?Q?RLB8px2KWDCByCDw/+vOqNouBNgihDihKCoKK8ege2i2KKhjwAqbStXHgTeM?=
	=?us-ascii?Q?LRZSoR+wkKMSsx5BjlbfyCFaDekOLHZnAhEfL9BnHxHwFR1LhRqpSg+tu9WL?=
	=?us-ascii?Q?EpCwZ5OzpCAktgwa8dP3yn020yyXL/jIfPPK+Wo37y6SwLeWhQzcDQmxuqYL?=
	=?us-ascii?Q?8neww++s0sDeKVoIur3ZC8/Nz8GjUxP94QwQrrFl+h/+RuSesMQQgyBxWUhK?=
	=?us-ascii?Q?IyudZQe4UyIwGIdDQNlQftiG8cLBpPCX35UYlhihlOMYA7smqN24euiPvdJr?=
	=?us-ascii?Q?LRyGnZxW6iI4Uz0FXG1O13D6fH5+VwjrwbdwP7CX9+UpvxDbIT8dPQz7cqRt?=
	=?us-ascii?Q?i79RP8XBGyy0ti3yC13VSed4REvlvsLiKOBX+GU/doIOB27wKZPlUMDnQBVh?=
	=?us-ascii?Q?3fEYZ6iblqGyM4tI8RcE/dR8q9Z2HhJZ+D9ieUo2lkS+MXWeCUcPa45wdz8d?=
	=?us-ascii?Q?RldObn5mLvVy7bwoczd+gmSbDo2zSXHgSQoMvTOW2WD1WbvCf2b7YZ2xzuP2?=
	=?us-ascii?Q?9KgTr37ceStV6HzT7c61j49TAa/MB3qLhxUiI07dBp4t4dT6OzZojYrcFsMr?=
	=?us-ascii?Q?XmitPZlAPT5QeXXGPSQpzODMLmE0gPs5jM3YBKUUUR/e9yyTuhe73SKhGgpn?=
	=?us-ascii?Q?Y/gQFxbG87wFxfFWvIqCcU8JQz8dBVqyVuMlvgbFD7rWcHnm+4KAUUc0yOs4?=
	=?us-ascii?Q?370TDFDyx8mC4nLRVB5LoVG8rSvCzt0UuwXUP/RU6luBOIUNnp0wD0E5TtwZ?=
	=?us-ascii?Q?fyOqOCNitxnITMHFv45QgpL3lfdASfNYSq9umPM5uCkdVrIXlmkw5tV8tutx?=
	=?us-ascii?Q?izobxA1eJadhDwj2ciHTJkMctRISZYR5WBldJdNjEMjxDC21Kuk6KsiXdFXZ?=
	=?us-ascii?Q?PvXRBDPy+eFQWYxZ7Wg73Yd9R9bwWXi1Y4WTyYMFz1R49ElFrXUgav/7Uu5h?=
	=?us-ascii?Q?xa5RoVofF5BBA/ZM1ybe5jTPb5HB3dlqtVhARq5zs/oW9xqiBIaPJEVhhV1c?=
	=?us-ascii?Q?AaApuMjzrSx0Xu89rE49OyCE25D5eMsxmkspean43ahuXVvJhhMGw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB2049;
	6:rVrGlSzBZ6xiXUc4t7zR0Tz9vMnQjoJ5iJ2iqN6hNYzHdSND/uDzAhb42xs9H7L1VArTg5IjI7D3+6ohs0R5ytEFTm03jd889/IFV1gyPo5PcyNQyBRUkbIqdnw7D00BirvWmmRkMTaWu/QSLNz81uetATLvTty8Y7G0RoWvSabukHjBx4vE/c/ZRzc2BlAEh795DGCasQoZtm056EKshlCwqlEjbeicedKiZGgVPO/nQfFR6gJ+Jl+c8rVcacp+8Lizn8v6IvdPOHQdhtCrNbFUVsyNp7vJX6WcpKXcaLcAGUBm/gWAofhcjs0LlE49;
	5:OFjBjNoyBKwZz1Qt8JFXkhDBYmJWgnisOxSMYZmVSsUGA+coK1Oz0XYQE9J9fiI9LbECbUhMN9KJ+tUZ8g+DC7qWpuNfs9YCDZ7A8d4XULM2iUOGIJp8Vb3ky3COiAZKqaJuRhwKivuzdbY+P0Bgcg==;
	24:fjnqpYbGx1n9m8C7exqeJmB4CSzeym5yh0J930dghVaSZzygvREnib+qObp/Emx09SZgkm4B1blXYwXI68UJbrJiqeB8Z9KQFD+tuMU2zH8=;
	7:APnSbFZms3AQSh10RrBxEStfzqpZzCH90jFNQyeRsmnYMuRXzEoEK1Vc0En8+vFt1au7R4VAtEpt7P3e0QE2v2KQAmy3fcbEr4Jgu2iEypDhAI2NT4SKqLx1VTuPr2TN9oIOoSvyKxUtM/gVt3XPPBKkgoh9OZzlOQnyzOvIAa9lUTxplk4siBVoTQpFRoF1UyZ1VWIjuJgBIhCmU9oS0DA3j1+ZMsHP28tm+UGuTHWOol/iOi2Dt7KHzwfZGVkNMuV4fnm2N05Z39r9+KdjHQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2016 22:54:54.8751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB2049
Subject: [PATCH] python-salttesting: Add ptest output format patch
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
X-List-Received-Date: Tue, 28 Jun 2016 23:11:03 -0000
Content-Type: text/plain

Add a patch that allows the output of running the salt test suite to be
in ptest format.

Signed-off-by: Collin Richards <collin.richards@ni.com>
Natinst-ReviewBoard-ID: 143279
---
 ...001-Add-ptest-output-option-to-test-suite.patch | 232 +++++++++++++++++++++
 .../python/python-salttesting_2015.2.16.bb         |   6 +-
 2 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch

diff --git a/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
new file mode 100644
index 0000000..c297320
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
@@ -0,0 +1,232 @@
+From 7e2642530bfd4ac0226b90404e7a4511e44756b6 Mon Sep 17 00:00:00 2001
+From: Collin Richards <collin.richards@ni.com>
+Date: Tue, 28 Jun 2016 16:02:22 -0500
+Subject: [PATCH] Add ptest output option to test suite
+
+Extend salttesting to support outputing the results of running the test
+suite in ptest format.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Collin Richards <collin.richards@ni.com>
+Natinst-ReviewBoard-ID: 143279
+---
+ salttesting/parser/__init__.py |  12 +++
+ salttesting/ptest.py           | 168 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 180 insertions(+)
+ create mode 100644 salttesting/ptest.py
+
+diff --git a/salttesting/parser/__init__.py b/salttesting/parser/__init__.py
+index 1e7275b4b65ef29deb89049a70bf6a074e11873d..d8cba0cb1e4814b7065b6896186c25300048ec92 100644
+--- a/salttesting/parser/__init__.py
++++ b/salttesting/parser/__init__.py
+@@ -25,6 +25,7 @@ from functools import partial
+ from contextlib import closing
+ 
+ from salttesting import TestLoader, TextTestRunner
++from salttesting.ptest import PTestRunner
+ from salttesting.version import __version_info__
+ from salttesting.xmlunit import HAS_XMLRUNNER, XMLTestRunner
+ try:
+@@ -264,6 +265,12 @@ class SaltTestingParser(optparse.OptionParser):
+             action='store_true',
+             help='Do NOT show the overall tests result'
+         )
++        self.output_options_group.add_option(
++            '--ptest-out',
++            dest='ptest_out',
++            default=False,
++            help='Output test results in PTest format'
++        )
+         self.add_option_group(self.output_options_group)
+ 
+         self.fs_cleanup_options_group = optparse.OptionGroup(
+@@ -491,6 +498,11 @@ class SaltTestingParser(optparse.OptionParser):
+                 verbosity=self.options.verbosity
+             ).run(tests)
+             self.testsuite_results.append((header, runner))
++        elif self.options.ptest_out:
++            runner = PTestRunner(
++                stream=sys.stdout,
++                verbosity=self.options.verbosity).run(tests)
++            self.testsuite_results.append((header, runner))
+         else:
+             runner = TextTestRunner(
+                 stream=sys.stdout,
+diff --git a/salttesting/ptest.py b/salttesting/ptest.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..9780886bc8f9d400aab2e96a33b14af980e64315
+--- /dev/null
++++ b/salttesting/ptest.py
+@@ -0,0 +1,168 @@
++# -*- coding: utf-8 -*-
++
++"""
++Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
++2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights
++Reserved
++
++PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
++--------------------------------------------
++
++1. This LICENSE AGREEMENT is between the Python Software Foundation
++("PSF"), and the Individual or Organization ("Licensee") accessing and
++otherwise using this software ("Python") in source or binary form and
++its associated documentation.
++
++2. Subject to the terms and conditions of this License Agreement, PSF hereby
++grants Licensee a nonexclusive, royalty-free, world-wide license to reproduce,
++analyze, test, perform and/or display publicly, prepare derivative works,
++distribute, and otherwise use Python alone or in any derivative version,
++provided, however, that PSF's License Agreement and PSF's notice of copyright,
++i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
++2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights
++Reserved" are retained in Python alone or in any derivative version prepared by
++Licensee.
++
++3. In the event Licensee prepares a derivative work that is based on
++or incorporates Python or any part thereof, and wants to make
++the derivative work available to others as provided herein, then
++Licensee hereby agrees to include in any such work a brief summary of
++the changes made to Python.
++
++4. PSF is making Python available to Licensee on an "AS IS"
++basis.  PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
++IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
++DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
++FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
++INFRINGE ANY THIRD PARTY RIGHTS.
++
++5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
++FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
++A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
++OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
++
++6. This License Agreement will automatically terminate upon a material
++breach of its terms and conditions.
++
++7. Nothing in this License Agreement shall be deemed to create any
++relationship of agency, partnership, or joint venture between PSF and
++Licensee.  This License Agreement does not grant permission to use PSF
++trademarks or trade name in a trademark sense to endorse or promote
++products or services of Licensee, or any third party.
++
++8. By copying, installing or otherwise using Python, Licensee
++agrees to be bound by the terms and conditions of this License
++Agreement.
++
++Modified Version of Python's TextTestRunner
++"""
++
++import time
++import sys
++import string
++
++import unittest
++TestResult = unittest.TestResult
++
++
++class _WritelnDecorator(object):
++    """Used to decorate file-like objects with a handy 'writeln' method"""
++    def __init__(self, stream):
++        self.stream = stream
++
++    def __getattr__(self, attr):
++        if attr in ('stream', '__getstate__'):
++            raise AttributeError(attr)
++        return getattr(self.stream, attr)
++
++    def writeln(self, arg=None):
++        if arg:
++            self.write(arg)
++        self.write('\n')  # text-mode streams translate to \r\n if needed
++
++
++class _PTestResult(TestResult):
++    """A test result class that can print formatted text results to a stream.
++
++    Used by PTestRunner.
++    """
++    separator1 = '=' * 70
++    separator2 = '-' * 70
++
++    def __init__(self, stream, descriptions, verbosity):
++        TestResult.__init__(self)
++        self.stream = stream
++        self.showAll = verbosity > 1
++        self.dots = verbosity == 1
++        self.descriptions = descriptions
++
++    def getDescription(self, test):
++        if self.descriptions:
++            return test.shortDescription() or str(test)
++        else:
++            return str(test)
++
++    def startTest(self, test):
++        TestResult.startTest(self, test)
++
++    def addSuccess(self, test):
++        TestResult.addSuccess(self, test)
++        if self.showAll:
++            self.stream.writeln("PASS: {0}".format(self.getDescription(test)))
++        elif self.dots:
++            self.stream.write('.')
++
++    def addError(self, test, err):
++        TestResult.addError(self, test, err)
++        if self.showAll:
++            self.stream.writeln("FAIL: ERROR {0}".format(self.getDescription(test)))
++        elif self.dots:
++            self.stream.write('E')
++
++    def addFailure(self, test, err):
++        TestResult.addFailure(self, test, err)
++        if self.showAll:
++            self.stream.writeln("FAIL: {0}".format(self.getDescription(test)))
++        elif self.dots:
++            self.stream.write('F')
++
++    def printErrors(self):
++        if self.dots or self.showAll:
++            self.stream.writeln()
++        self.printErrorList('ERROR', self.errors)
++        self.printErrorList('FAIL', self.failures)
++
++    def printErrorList(self, flavour, errors):
++        for test, err in errors:
++            self.stream.writeln(self.separator1)
++            self.stream.writeln("{0}: {0}".format(flavour, self.getDescription(test)))
++            self.stream.writeln(self.separator2)
++            self.stream.writeln("{0}".format(err))
++
++
++class PTestRunner:
++    """A test runner class that displays results in PTest format.
++
++    """
++    def __init__(self, stream=sys.stderr, descriptions=1, verbosity=1):
++        self.stream = _WritelnDecorator(stream)
++        self.descriptions = descriptions
++        self.verbosity = 2
++
++    def _makeResult(self):
++        return _PTestResult(self.stream, self.descriptions, self.verbosity)
++
++    def run(self, test):
++        "Run the given test case or test suite."
++        result = self._makeResult()
++        startTime = time.time()
++        test(result)
++        stopTime = time.time()
++        timeTaken = float(stopTime - startTime)
++        result.printErrors()
++        run = result.testsRun
++        self.stream.writeln("Ran %d test%s in %.3fs" %
++                            (run, run == 1 and "" or "s", timeTaken))
++        self.stream.writeln(result.separator2)
++        self.stream.writeln()
++        return result
+-- 
+1.9.1
+
diff --git a/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb b/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
index 78ad879..2a5ed20 100644
--- a/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
+++ b/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
@@ -5,7 +5,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
 SRCNAME = "salt-testing"
 
-SRC_URI = "https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz"
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
+
+SRC_URI = "https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz \
+           file://0001-Add-ptest-output-option-to-test-suite.patch \
+           "
 SRC_URI[md5sum] = "8ca55a796e9ad7ba72bc143043753ccf"
 SRC_URI[sha256sum] = "0ef4be6a8a9b505ae1c328394dfad50493674af6100c7e2c220f374533d86edc"
 
-- 
1.9.1


