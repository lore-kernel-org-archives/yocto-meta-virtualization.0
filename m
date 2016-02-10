Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFBD3E00CE6; Wed, 10 Feb 2016 06:23:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FBD5E00CE0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Feb 2016 06:23:12 -0800 (PST)
X-TM-IMSS-Message-ID: <a2916b5600089c3d@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	a2916b5600089c3d ; Wed, 10 Feb 2016 09:22:48 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u1AENB6R026172
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Feb 2016 09:23:11 -0500
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
Message-ID: <56BB4783.5030902@tycho.nsa.gov>
Date: Wed, 10 Feb 2016 09:21:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: xen stubdom support
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
X-List-Received-Date: Wed, 10 Feb 2016 14:23:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Is there a technical reason that stubdom support is disabled in the xen
recipes?
-Machon

