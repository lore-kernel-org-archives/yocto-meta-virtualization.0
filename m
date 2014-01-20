Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C23FE00894
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jan 2014 10:07:04 -0800 (PST)
Received: by mail-lb0-f172.google.com with SMTP id c11so5237243lbj.31
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jan 2014 10:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Fm7MGS1kIgFD/vWiiem/ercpjFEZkKn/ZI72orraKak=;
	b=EPYDgolnOnVxsEmO3AbNgXYPRb6XaZSlmXsrGiMaamq/vPaijsqyFhZYcXWL5PJv1j
	8s0hSFYrrF46gY+mHc1t3z17oq+Ur0Ec44nR3/u++YGL0ZF5Ua62/GQdceoXjik7orxt
	MoNQMThAAxkY80FqmTRxDNcpTPwZqozT663hOapP/NBwBSfthUfD26zQht9AyaTrLrPV
	ommGbFDII2SEU8DmPaoTf+2swe7Tuz1x4FpDxBZg8GzthNyHi2PrzQSxWT1qmX6Js+7v
	zb6j/4FdJ6q1yuf3UspjCTWjXPpFs+RJlK2tKWMU+raj5v9taxjaf08UkbtwwzE+tgmQ
	f5hg==
MIME-Version: 1.0
X-Received: by 10.112.72.70 with SMTP id b6mr12366240lbv.0.1390241223034; Mon,
	20 Jan 2014 10:07:03 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Mon, 20 Jan 2014 10:07:02 -0800 (PST)
In-Reply-To: <CABZSBQeZqkuJg=CoJa+i1u=+vbJQbPj7Vs20Xo1noEm=0DgMrA@mail.gmail.com>
References: <1390183175-1718-1-git-send-email-flihp@twobit.us>
	<CABZSBQeZqkuJg=CoJa+i1u=+vbJQbPj7Vs20Xo1noEm=0DgMrA@mail.gmail.com>
Date: Mon, 20 Jan 2014 13:07:02 -0500
Message-ID: <CADkTA4N35iBR6kmCvY-R1PEPHAdmF69Zn9YyXMM2gaD7J-O9+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/3] Xen recipe minor cleanup.
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
X-List-Received-Date: Mon, 20 Jan 2014 18:07:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 12:11 PM, Chris Patterson <cjp256@gmail.com> wrote:
> +1, series looks good to me.

.. and merged!

Bruce

>
>
> On Sun, Jan 19, 2014 at 8:59 PM, Philip Tricca <flihp@twobit.us> wrote:
>>
>> Philip Tricca (3):
>>   xen: Move supporting files into xencommons and xendomains packages.
>>   xen: Cleanup watchdog FILES declaration.
>>   xen: Add RDEPENDS for xencommons.
>>
>>  recipes-extended/xen/xen.inc |   25 +++++++++++++++++++------
>>  1 file changed, 19 insertions(+), 6 deletions(-)
>>
>> --
>> 1.7.10.4
>>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

