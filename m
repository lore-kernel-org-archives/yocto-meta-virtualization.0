Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B268AE00A7D; Tue, 19 Jan 2016 04:13:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.10 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea09.nsa.gov (emvm-gh1-uea09.nsa.gov [63.239.67.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBA32E008F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 04:13:28 -0800 (PST)
X-TM-IMSS-Message-ID: <9d5b061300010b5f@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	9d5b061300010b5f ; Tue, 19 Jan 2016 07:16:14 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u0JCDQqx030277
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 07:13:26 -0500
To: meta-virtualization@yoctoproject.org
References: <569962FB.8070601@tycho.nsa.gov> <56996543.9070709@mvista.com>
	<569D0DBF.2020007@cardoe.com>
	<CADkTA4PFkbhtMk0FZdU9_11fu6L2P+UDr3hzy2fJ43MW3i9MRA@mail.gmail.com>
	<CABZSBQciLB0t5jn_FoHW6s8pD6PV8Q9S5h9z4t7k_--C++-5AQ@mail.gmail.com>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
X-Enigmail-Draft-Status: N1110
Message-ID: <569E2842.3090704@tycho.nsa.gov>
Date: Tue, 19 Jan 2016 07:12:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CABZSBQciLB0t5jn_FoHW6s8pD6PV8Q9S5h9z4t7k_--C++-5AQ@mail.gmail.com>
X-TM-AS-MML: disable
Subject: Re: Error building xen-image-minimal
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
X-List-Received-Date: Tue, 19 Jan 2016 12:13:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I am up-to-date (6ec960100...). When I remove the patch (below) I get
the same QA Issue (below). All the meta-virtualization dependencies are
up-to-date on master, also. My local.conf is the default yocto
configuration with MACHINE ?= "genericx86-64" and DISTRO_FEATURES_append
= " xen". Am I missing something? And why is the ${PN}-devd not need in
the PACKAGE variable?
-Machon

Patch:

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index ac9796b..c63cb2c 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -149,6 +149,7 @@ PACKAGES = "\
     ${PN}-console \
     ${PN}-dbg \
     ${PN}-dev \
+    ${PN}-devd \
     ${PN}-doc \
     ${PN}-flask \
     ${PN}-fsimage \

QA Issue:

ERROR: QA Issue: xen: Files/directories were installed but not shipped
in any package:
  /etc/init.d/xendriverdomain
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within do_install.
xen: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: Fatal QA errors found, failing task.
ERROR: Function failed: do_package
ERROR: Logfile of failure stored in:
/home/mbgrego/work/yocto/poky/build/tmp/work/core2-64-poky-linux/xen/4.6.0-r0/temp/log.do_package.4500
ERROR: Task 337
(/home/mbgrego/work/yocto/poky/meta-virtualization/recipes-extended/xen/xen_4.6.0.bb,
do_package) failed with exit code '1'



On 01/18/2016 03:37 PM, Chris Patterson wrote:
> Everything looks good on my end.  Machon, can you confirm you are
> up-to-date on master?

