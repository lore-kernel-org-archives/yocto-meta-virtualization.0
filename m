Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6ACBE00B28; Tue, 20 Mar 2018 16:03:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA382E00708
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Mar 2018 16:03:27 -0700 (PDT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2KN3LRU020417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Mar 2018 23:03:22 GMT
Message-ID: <1521587001.25754.204.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, Kurt Bodiker
	<kurt.bodiker@braintrust-us.com>
Date: Tue, 20 Mar 2018 23:03:21 +0000
In-Reply-To: <CACMJ4GbGA+De1quOn_qa4FGNWuPdXmycrUbJcdoCdBzohTfmJA@mail.gmail.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<d59c1a4b1f58515ff9d4db9470019c630da4df5e.1519915283.git.kurt.bodiker@braintrust-us.com>
	<CACMJ4GYkqBL+zBnqfNOg+iy=7dqJF3EaMf743Wrwd44pQ2hhqA@mail.gmail.com>
	<CACMJ4GbGA+De1quOn_qa4FGNWuPdXmycrUbJcdoCdBzohTfmJA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/7] xen: Define the standard values needed for stubdoms
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
X-List-Received-Date: Tue, 20 Mar 2018 23:03:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-03-20 at 11:25 -0700, Christopher Clark wrote:
> In testing, this constraint of package version doesn't produce the
> build behaviour I was hoping for: bitbake doesn't enforce the version
> constraint at build time and from earlier related posts on the
> mailing list, this behaviour is known, so presumably is intentional.

"Intentional" isn't right. We want to support it but have never gotten
around to it. Making DEPENDS support version info was the first step
which we did, so we can add the info but nothing currently acts on it.

Cheers,

Richard


