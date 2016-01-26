Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE736E00C05; Tue, 26 Jan 2016 15:14:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_DYNAMIC
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 KHOP_DYNAMIC Relay looks like a dynamic address
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34473E00BFD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 15:14:30 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0QNERUS011013; Tue, 26 Jan 2016 23:14:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7MzjcZIyhPOz; Tue, 26 Jan 2016 23:14:27 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0QNELZl011002
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Jan 2016 23:14:22 GMT
Message-ID: <1453850061.10340.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Doug Goldstein <cardoe@cardoe.com>, Chris Patterson <cjp256@gmail.com>
Date: Tue, 26 Jan 2016 23:14:21 +0000
In-Reply-To: <56A78E72.6030906@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<1453735752-966-2-git-send-email-cardoe@cardoe.com>
	<CABZSBQcLHD9Kz56ysb-xe1jHWoAH7gvQYswOXsv4gmBJBJafeA@mail.gmail.com>
	<56A78E72.6030906@cardoe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/5] xen: drop explicit DEPEND on libgcc
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
X-List-Received-Date: Tue, 26 Jan 2016 23:14:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-01-26 at 09:19 -0600, Doug Goldstein wrote:
> hmm. I'd rather respin it without that change then. Interesting that
> the
> NEEDED check doesn't pick it up as a dependency.

Its a known issue with the way libpthread dlopen()s libgcc. In some
ways, the pthread library should really RRECOMMEND libgcc, however
since its part of the main glibc package, that would mean libgcc
effectively everywhere.

Its only used by a limited subset of the pthread functionality so there
are cases you don't need it.

Cheers,

Richard



