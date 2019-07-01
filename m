Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3BD7E00D00; Mon,  1 Jul 2019 08:38:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56D3EE008CA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Jul 2019 08:38:22 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id i21so13708690ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Jul 2019 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CLMrkUdm9sLcuM/nIlmZbBmu0LqdjaJfJ+w8J6OdV9E=;
	b=vWF3NtQLCg+yoTuvxUNGL+zImmxxRvyjqHJBGjNKvL6qUo8rvYc+wh/HkGE7WW84aT
	sSVLwByGU8aIQaLKQC+qNQnFm2CYk6a39kyXtBLwXmp91uTb+WSAPTjh7rnLdYMI0hDY
	PVZWHCXkyK5CrggGHBwQfv+yRRBDcF26D6xLZFKp83fPZfiH5LIC2JKQQEoL6KkfslFs
	3XW94ezY27ZjIcGw+lemSgkUKwrSzNAIFuh2Zi4m/yd6Ww2F+PTg8zQXBXe9Qms9k/v0
	H2AAkNybRAa9iG/6WCAMpOSzrArO9xsglUyt86hB3rEV8k+cjqKZjineXmIE7x/kQQ18
	cNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CLMrkUdm9sLcuM/nIlmZbBmu0LqdjaJfJ+w8J6OdV9E=;
	b=BhSSHO0/LLWfix9TZnxbbcqmvjA7OCjZ1+n9d55VtirL36eWI5qRjaE5KFAgjcltgq
	lq/TEIkX7pqs/b8TU9wbhZfsPLBXR1+sr2x3LzTsCSuTrFzHfoLWgqY21mqoX3O4i2l/
	DA/mboFgqTbnV/F5/Eq9+tOU7rw06Cm8G2Xu3eaiql/Kph2L7UOLxQI/6MYXkcra+5F8
	ipTAURbf1MlozJNmG/VgCbkRtwVN5NrkBdNbDlBEsyyMUNMeaEM8maz4lrfjYZjKUoP/
	Tu1My9lhlVczxDTWuz7CK5ni5QJJJew+KHNMSx6U0DNpikoeP0MCGRbuR6bGbjbbwknP
	Ue7g==
X-Gm-Message-State: APjAAAXNr9Ejaop2W3Kikl36zDDajIu4quy5c3D7lpT6drooUWEvFhwR
	lqzCvMFN6PgC2rpVY84i8KrsiJjz5Qx7dRGLBU8=
X-Google-Smtp-Source: APXvYqw+83VYzMXsoiH+dLUqVXKUjKrgYytxz5+mKSuVRo7NtxzGkV25NNxDAc2TdP8z3uLqJDr7C7JyElI0S3o73nQ=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr14424147ljj.185.1561995501067; 
	Mon, 01 Jul 2019 08:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <1561674444-21344-1-git-send-email-bostancioglucevat@gmail.com>
	<CABPcKDMuW_7WwCJzbFnxn+MxnXk4MfTUOiqq+7b0rJa7p9+aGQ@mail.gmail.com>
In-Reply-To: <CABPcKDMuW_7WwCJzbFnxn+MxnXk4MfTUOiqq+7b0rJa7p9+aGQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 1 Jul 2019 11:38:09 -0400
Message-ID: <CADkTA4O7qqfoOPEuaUmg562qXFkJQEE-5h2coWWxya4jdfHPkg@mail.gmail.com>
To: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] singularity: openssl cert configs path fixed.
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
X-List-Received-Date: Mon, 01 Jul 2019 15:38:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's only been on the list for 4 days, 2 of which were a weekend (and
today is a holiday where I am). Almost everything sits on the list for
48 hours while waiting for comments, then is queued to be pushed after
that.

So it is just over the 48 hour comment window, and I'll most likely
queue it on Tuesday.

Bruce

On Mon, Jul 1, 2019 at 5:06 AM Cevat Bostanc=C4=B1o=C4=9Flu
<bostancioglucevat@gmail.com> wrote:
>
> Hello, did you guys checked this patch?
> Cevat
>
> ---------- Forwarded message ---------
> G=C3=B6nderen: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> Date: 28 Haz 2019 Cum, 01:27
> Subject: [meta-virtualization][PATCH] singularity: openssl cert configs p=
ath fixed.
> To: <meta-virtualization@yoctoproject.org>
> Cc: Cevat Bostancioglu <bostancioglucevat@gmail.com>
>
>
> openssl recipe moves ssl-1.1 directory as ssl , singularity recipe cannot=
 find ssl-1.1 path.
> ---
>  recipes-containers/singularity/singularity_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-=
containers/singularity/singularity_git.bb
> index 6fee8f3..e50052c 100644
> --- a/recipes-containers/singularity/singularity_git.bb
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -30,6 +30,6 @@ pkg_postinst_${PN}() {
>
>      # python3 expects CA certificates to be installed in a different pla=
ce to where
>      # they are actually installed. These lines link the two locations.
> -    rm -r $D${libdir}/ssl-1.1/certs
> -    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1
> +    rm -r $D${libdir}/ssl/certs
> +    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl
>  }
> --
> 2.7.4
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

