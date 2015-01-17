Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C165E00951; Fri, 16 Jan 2015 20:58:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE9FBE008FF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Jan 2015 20:58:12 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id z12so940487lbi.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Jan 2015 20:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=/2a0BZKrz+8q9iYnHQkJ3Hr6gd72PYn3T3vpTza9uUg=;
	b=jnzLyqMfkrD0q9v9+Zizo1a09w035HIWCXPCTRMtg8N7XXI7sMYbFZQ29qgqCl8kuD
	4CJcwopNInhnBFougc2oGlMNdesCRLRFVqugdmFkE8XTQYfZb6YuuGV7X9Rg6BMb6Eej
	/tiYWZrBPYZeB+k3GrMN8ew9IGc7iXdZTsy6plC/m9IIa1Wt6tOBxnjpdgUDCnAz5gwo
	WYJiFZgC9ZqRlIx5HQqPb4BIP12lw6zn6nOinbughFUH5X+nQDutsJCND3Rx+Qm9TbUe
	c0++BXiTldSyWfR5DYpgVCOiY1xarLxbNIfuIIqPkktvbfrD2mYd1hvBU5X54utvSxbk
	r0Rg==
MIME-Version: 1.0
X-Received: by 10.112.98.99 with SMTP id eh3mr18844491lbb.32.1421470690796;
	Fri, 16 Jan 2015 20:58:10 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Fri, 16 Jan 2015 20:58:10 -0800 (PST)
In-Reply-To: <4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5@sestoex09.enea.se>
References: <4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5@sestoex09.enea.se>
Date: Fri, 16 Jan 2015 23:58:10 -0500
Message-ID: <CADkTA4NrV_LxtBowJTz8kHDuECVXMjY3PXizFPG3G6dhNr20VQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Christian_Zieth=C3=A9n?= <Christian.Ziethen@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: cfg fragments for networking.
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
X-List-Received-Date: Sat, 17 Jan 2015 04:58:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2015 at 10:21 AM, Christian Zieth=C3=A9n
<Christian.Ziethen@enea.com> wrote:
> Hi,
>
>
>
> We have some cfg fragments currently included for our local builds and we
> were discussing inclusion of the fragments in the meta-virtualization lay=
er
> and I figured I=E2=80=99d ask if there was any interest in including them=
 upstream?
>

I'm definitely interested. I have some of my own fragments that I use for
container/cloud networking, so it would be nice to see if there were common
elements and create some factored out fragments.

>
>
> They are three files with the necessary configs for enabling virtio, vhos=
t
> and veth, similar to the currently available vswitch.cfg. (They would be
> wrapped in scc:s though.)
>

That would be perfect. They can either be merged to meta-virt, or be merged
into the kernel repository itself and enable via KERNEL_FEATURES.

Cheers,

Bruce

>
>
> Best regards,
>
> Christian Zieth=C3=A9n
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

