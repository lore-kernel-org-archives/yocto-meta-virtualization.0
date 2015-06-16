Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB484E00A4F; Tue, 16 Jun 2015 05:03:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7467E009E6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jun 2015 05:03:52 -0700 (PDT)
Received: by yhpn97 with SMTP id n97so9507985yhp.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jun 2015 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=3bZ/ys/2xZmwoujQmCu+7zi54rHddAcGnqwfjNq1krM=;
	b=viuVxkcXQDNTVIFhf8OFiMFNEowLf+eYSXr6hA/r1mU2qT5LYYs5/yhcyW+kHywCK9
	Kd9dW2Hq9h2bsXKbmCuH0tC8jUdg8Ncu/Dc/6tcZCz1HK5ATYBFn+8FF4KIeWDYJPZXX
	1EhsgOib3MpKXKOTGAA5mTTKs6FewdaUsUOTrbOI6435vXKEDUuMhhUQm/M1FFXh7zjl
	LgPbYlkiITWMUexhX507IhLcwNfzt3G9gViCSs0KKDTyJ0qJzS8V5GCcn66T1vbnP5Z1
	QdJhXNx4MbiM1YRwBUQADN37YD1Z5dMro4YQzgEGuZx2nvHfL+wWlWwJDs3Nr7Ylu5Nq
	o2SQ==
MIME-Version: 1.0
X-Received: by 10.129.146.71 with SMTP id j68mr34779ywg.68.1434456231889; Tue,
	16 Jun 2015 05:03:51 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Tue, 16 Jun 2015 05:03:51 -0700 (PDT)
In-Reply-To: <CA+AhUGx08V9KdA7NHpLnzR1EzL3LBPRTyUOKj2S7-w5MQhRVMg@mail.gmail.com>
References: <CA+AhUGx08V9KdA7NHpLnzR1EzL3LBPRTyUOKj2S7-w5MQhRVMg@mail.gmail.com>
Date: Tue, 16 Jun 2015 08:03:51 -0400
Message-ID: <CADkTA4OpmUXxoiC8SwZNJiYWmcDmoBM8YWQ1At=UA_0jKh7zLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Creating a fido branch
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
X-List-Received-Date: Tue, 16 Jun 2015 12:03:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2015 at 4:47 AM, Erik Bot=C3=B6 <erik.boto@pelagicore.com> =
wrote:
> Hi,
>
> I noticed that there isn't any fido branch, and since the following
> commit the master branch does not work with Poky's fido branch.
>
> "cloud-image-*: catch up with OE-core class rename
>
> OE-core rev 0a3e8eb9f592c3f1edd2c7521855f7406541651a renamed
> 'image-vmdk' to 'image-vm'. IMAGE_FSTYPES didn't change, so keep those
> as 'vmdk'.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>"
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=
=3De50e36cfa3898b1defcbffe9f3fd0a20403c8de3
>
> I'm not sure if there's a policy of branching of to keep compatibility
> for certain oe-core/poky versions, but I saw that there are branches
> for e.g. dizzy and daisy so I hope that it's ok to do so.

I typically only do it when someone asks :) Otherwise, I simply keep
master up to date
with oe-core master.

I did note the commit when fido released, so I can create the branch
later today.

Bruce

>
> Cheers,
> Erik
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

