Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E905E00B49; Thu, 18 Dec 2014 10:45:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D17A4E009B3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Dec 2014 10:45:20 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id hs14so1489448lab.22
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Dec 2014 10:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Lni1BmukU7+fmz1JeAUAq5eSkkODAISqD9tPn2sRRGY=;
	b=oK0V3MxMfYVThrbsUduDTVzkKqUAGIOsF8LRBzgsKWQWdzTdjLjdv+CaocOCacE7DA
	0uEV8djqq5dGQAOsHUFtrhoM+ZuDlBArPOPXdANJ7GlaeMSRem43xu+hloKnPXVs7a0i
	/Rw87jzqGQMIxkxxeGzvgLwNl6FMSSEOUf/hn6rM+LJJsyQwJl8XDHFQXGq/BQnnf+NM
	TZqz/1MPbt+rklv0QrjsJj4UQ2HqBf9DgraTsCGSlOaoREI5pO2Ods5C6hos42Br5MHt
	HMdFZqi6d4Bjponorw+DzYL4xYJlZykKKOal72gO3f3CtkhsHZrFSIMtpRV8F81XeWLm
	PKlQ==
MIME-Version: 1.0
X-Received: by 10.112.150.71 with SMTP id ug7mr3704847lbb.73.1418928318493;
	Thu, 18 Dec 2014 10:45:18 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 18 Dec 2014 10:45:18 -0800 (PST)
In-Reply-To: <BL2PR03MB49705933F924B34CFE8797A84630@BL2PR03MB497.namprd03.prod.outlook.com>
References: <BL2PR03MB49705933F924B34CFE8797A84630@BL2PR03MB497.namprd03.prod.outlook.com>
Date: Thu, 18 Dec 2014 13:45:18 -0500
Message-ID: <CADkTA4NGqSKh9=W2_gdc+i3MJtcmgFkD6NWkP5U4ZKdNOw62mw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Benlei Xu <B51469@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: need your help about integrate opendayliht into meta-cloud-services
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
X-List-Received-Date: Thu, 18 Dec 2014 18:45:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 9:30 PM, Benlei Xu <B51469@freescale.com> wrote:
> Hell all,
>
>
>
> I want to add OpenDaylight to meta-cloud-services layer, but the Daylight
> have more than 220mb and if we use that software we have to connect to
> internet,
>
> otherwise, we can=E2=80=99t use the software correctly. So I want to know=
 whether
> need to add a recipe to meta-cloud-services? We just need to load Dayligh=
t
> to our
>
> system from internet if we want to use it.

Sorry for the slow reply.

Are you still working on this ? Can you elaborate on the problem you
are facing ?
Are you saying that when building opendaylight, there is a 220mb download a=
nd
you are looking to avoid it ?

Bruce

>
>
>
> Best Regards,
>
> Benlei
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

