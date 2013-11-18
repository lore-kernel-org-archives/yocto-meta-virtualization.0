Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F27DE00569
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Nov 2013 01:33:17 -0800 (PST)
Received: from 81-5-137-245.dsl.eclipse.net.uk ([81.5.137.245]
	helo=[172.16.1.10]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1ViLCR-00032F-6d; Mon, 18 Nov 2013 09:32:55 +0000
Message-ID: <5289DED2.9090908@twobit.us>
Date: Mon, 18 Nov 2013 04:33:06 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <CADkTA4OKxUpKr=0mqFREY9UCTWfAoG3QJwFft481rOwLc_cL7w@mail.gmail.com>
In-Reply-To: <CADkTA4OKxUpKr=0mqFREY9UCTWfAoG3QJwFft481rOwLc_cL7w@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 81.5.137.245
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,TVD_RCVD_IP
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Xen Query ...
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
X-List-Received-Date: Mon, 18 Nov 2013 09:33:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Morning Bruce,

On 11/16/2013 10:42 PM, Bruce Ashfield wrote:
> Just sending a question to see who else is building Xen from meta-virtualization
> master against yocto/oe-core master ?
> 
> All my builds have been failing on eglibc after adding xen and aufs to
> the DISTRO_FEATURES.
> I've worked around the problem and converted them to IMAGE_FEATURES to get full
> functionality, but I'm wondering if anyone else has seen this .. I
> want to rule out my
> build machine, and it being a one-off, before I dig any deeper.

I've not seen this in my builds (yet?). I generally pull from upstream
master oe-core/meta-oe/meta-selinux/meta-virtualization every day or two
so I'd expect I would have run into the same issue.

Got any build output?

Regards,
Philip


