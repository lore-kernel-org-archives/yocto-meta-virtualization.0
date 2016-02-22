Return-Path: <drquigl@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B59BE00BEA; Mon, 22 Feb 2016 13:22:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_40,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
	*      [score: 0.3632]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [63.239.67.10 listed in list.dnswl.org]
X-Greylist: delayed 859 seconds by postgrey-1.32 at yocto-www;
	Mon, 22 Feb 2016 13:22:29 PST
Received: from emvm-gh1-uea09.nsa.gov (emvm-gh1-uea09.nsa.gov [63.239.67.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D4E6E00BB6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 22 Feb 2016 13:22:29 -0800 (PST)
X-TM-IMSS-Message-ID: <0a1534f90000483a@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	0a1534f90000483a ; Mon, 22 Feb 2016 16:11:44 -0500
Received: from moss-clam.infosec.tycho.ncsc.mil (moss-clam [192.168.25.42])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u1ML87Ko007240
	for <meta-virtualization@yoctoproject.org>;
	Mon, 22 Feb 2016 16:08:07 -0500
Message-ID: <1456175226.32176.2.camel@tycho.nsa.gov>
From: drquigl <drquigl@tycho.nsa.gov>
To: meta-virtualization@yoctoproject.org
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Subject: stubs-32 patch not merged
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
Date: Mon, 22 Feb 2016 21:22:30 -0000
X-Original-Date: Mon, 22 Feb 2016 16:07:06 -0500
X-List-Received-Date: Mon, 22 Feb 2016 21:22:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

I attempted to build xen and ran into the stubs-32 issue mentioned on
the mailing list. The last email concerning it says that the patch was
merged but I don't see it anywhere in the repo. Was this just not
pushed upstream or am I cloning the wrong repo?

Dave

