Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0209E00BD2; Tue, 15 Dec 2015 09:27:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	TO_NO_BRKTS_PCNT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
X-Greylist: delayed 902 seconds by postgrey-1.32 at yocto-www;
	Tue, 15 Dec 2015 09:27:44 PST
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E47D0E00546
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Dec 2015 09:27:44 -0800 (PST)
X-TM-IMSS-Message-ID: <0e88889b00024ea2@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	0e88889b00024ea2 ; Tue, 15 Dec 2015 12:13:00 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id tBFHCdtE014202
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Dec 2015 12:12:39 -0500
To: meta-virtualization@yoctoproject.org
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
X-Enigmail-Draft-Status: N1110
Message-ID: <5670419A.70304@tycho.nsa.gov>
Date: Tue, 15 Dec 2015 11:36:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: Building xen-image-minimal with master
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
X-List-Received-Date: Tue, 15 Dec 2015 17:27:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I am new to Yocto/Openembedded. I have successful built the
xen-minimal-image and several variations using the fido branches of
meta-virtualization and the required meta-layers. I have several patches
I would like to submit to enable XSM to function correctly, so I moved
to the master branches of  meta-virtualization and the required
meta-layers. It seems that GCC 5.2 the default compiler for Yocto 2.0,
is incompatible with the current versions of Seabios and Xen.
Additionally, when I attempt to set my GCCVERSION = "4.9%", glibc seems
to still want to use GCC 5.2 and compilation errors occur.

I am using a clean Yocto install with upstream meta-openembedded and
meta-virtualization. I have altered my local.conf to include
DISTRO_FEATURES_append = " xen" and MACHINE="genericx86-64". Is
configuration incorrect?

If my configuration is correct is the correct course of action to patch
the offending files or move to a more recent version of Xen and Seabio?
Both have been patched to fix the incompatibilities with GCC 5.2?

Thanks for your time,
Machon

