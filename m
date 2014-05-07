Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D8DEE006EC; Wed,  7 May 2014 05:46:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
X-Greylist: delayed 65 seconds by postgrey-1.32 at yocto-www;
	Wed, 07 May 2014 05:46:21 PDT
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 5A755E003C7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 05:46:21 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.137) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 7 May 2014
	14:45:13 +0200
Date: Wed, 7 May 2014 14:45:13 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <20140507124513.GA18437@iapetus.enea.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: jslater@windriver.com
Subject: libvirt requires libssh2
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
X-List-Received-Date: Wed, 07 May 2014 12:46:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

A default dependency on libssh2 for libvirt was added recently. Where is libssh2
provided? I can not find it in either meta-oe or oe-core.

Thanks,
Josep

