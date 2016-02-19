Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D8D6E00CC6; Fri, 19 Feb 2016 02:29:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 65EE7E00C60
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Feb 2016 02:29:18 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 11:29:13 +0100
Date: Fri, 19 Feb 2016 11:29:14 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Message-ID: <20160219102913.GB5403@iapetus.enea.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: cherry pick 73fc67b1c056ac
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
X-List-Received-Date: Fri, 19 Feb 2016 10:29:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Bruce,

could you cherry pick 73fc67b1c056aca938a9ffa743de52995f380b03 from
fido-kilo to master? It seems this never got picked up in master. The
commit will honor DISTRO_FEATURES and will add xterm to the image
only if x11 is enabled.

Thanks!

/Josep

