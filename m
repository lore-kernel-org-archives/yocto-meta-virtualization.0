Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6ED3CE00978; Fri, 15 Jan 2016 13:22:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [63.239.67.10 listed in list.dnswl.org]
Received: from emvm-gh1-uea09.nsa.gov (emvm-gh1-uea09.nsa.gov [63.239.67.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F7FEE00928
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 13:22:35 -0800 (PST)
X-TM-IMSS-Message-ID: <8ab870e40000d393@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	8ab870e40000d393 ; Fri, 15 Jan 2016 16:24:27 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u0FLMW8p031943
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 16:22:33 -0500
To: meta-virtualization@yoctoproject.org
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
X-Enigmail-Draft-Status: N1110
Message-ID: <569962FB.8070601@tycho.nsa.gov>
Date: Fri, 15 Jan 2016 16:22:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: Error building xen-image-minimal
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
X-List-Received-Date: Fri, 15 Jan 2016 21:22:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I am still new to openembedded and I have not encountered the error
below before. It is occurring when building the xen-image-minimal
recipe. I added {PN}-devd, which contains xendriverdomain, to the
PACKAGE variable which solved the problem. Is that the correct solution?
-Machon

ERROR: QA Issue: xen: Files/directories were installed but not shipped
in any package:
  /etc/init.d/xendriverdomain
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within do_install.
xen: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: Fatal QA errors found, failing task.
ERROR: Function failed: do_package
ERROR: Logfile of failure stored in:
/home/mbgrego/work/yocto/poky/build/tmp/work/core2-64-poky-linux/xen/4.6.0-r0/temp/log.do_package.3354
ERROR: Task 337
(/home/mbgrego/work/yocto/poky/meta-virtualization/recipes-extended/xen/xen_4.6.0.bb,
do_package) failed with exit code '1'


