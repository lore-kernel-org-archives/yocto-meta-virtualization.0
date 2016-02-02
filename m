Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B219AE00C28; Tue,  2 Feb 2016 12:08:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECD26E00908
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 12:08:47 -0800 (PST)
X-TM-IMSS-Message-ID: <e726c39b000045cc@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	e726c39b000045cc ; Tue, 2 Feb 2016 15:11:09 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u12K8kXB029896
	for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Feb 2016 15:08:46 -0500
To: meta-virtualization@yoctoproject.org
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
X-Enigmail-Draft-Status: N1110
Message-ID: <56B10C90.8070709@tycho.nsa.gov>
Date: Tue, 2 Feb 2016 15:07:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: stubs-32.h not found
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
X-List-Received-Date: Tue, 02 Feb 2016 20:08:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I am working with the Xen recipes and I getting an odd behavior. The
build will sometimes fail compiling Xen. The failure is a result of the
absence of stubs-32.h (see error below). If I run a bitbake -c clean xen
and build xen again everything builds as expected. According to the logs
the do_stubs task runs and stubs-64.h is present in the sysroot, so
stubs-32.h should have been created by the do_stubs task. I checked the
timestamps on the do_populate_sysroot task of glibc and it was run after
do_stubs, which indicates a dependence problem. I thought that adding
glibc to the DEPENDS would fix the problem, but it did not. Any ideas? 
-Machon

fatal error: gnu/stubs-32.h: No such file or directory


