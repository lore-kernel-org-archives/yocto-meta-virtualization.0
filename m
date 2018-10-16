Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 731B1E00950; Tue, 16 Oct 2018 07:28:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FA6BE006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Oct 2018 07:28:33 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id s10-v6so17087555lfc.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Oct 2018 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S5eKbEiHstSOVAJ2en3wrAvbaZkczMPVt/xNUj675bY=;
	b=aIFsHFcBwvtQmid4E8MYIttoIqFzqR6QdXwdoCsJQd8ReY2zuhDTwW2B3q02TQBGrZ
	haWTiShT+96tJqrE4+kem+9QcDphoGIX1pwhd4YMZDvyf5yj5cHh8/bMRdUZYGO5gOk5
	D8imDoV69q62T0Pm+6vLXkNvBOxU4wSlM09dUOXHTXtP/F9029Jj99WiBwhF6aCeLFHu
	vjAQLL/rGPprVaI74YAFXKxu+R0YY3We4ojiyMyB965lRCO7oUmwZCiiWTAGXr1vZxsV
	+UuyI/cNzOIhAzz8DB1ul0yn8Fr7KkhY/p30lXuzLDP7KSiw4tO6KW9JocQTK/jop3x9
	8rgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S5eKbEiHstSOVAJ2en3wrAvbaZkczMPVt/xNUj675bY=;
	b=GMJjshbFEqcYcTryXesiGHaZT8cQx46hONP2brlb4UFkczqfaK4hd6C9msbphO7q1v
	VTF6aBrZ1s6WhDjPHNbqXJTSAR7DuD4bE5W/oC7PijTimCn6DLghPLF/TcCWl51W4rM2
	1EZX8XvpC+4c83FQinFGDX9xnpnNdM4xb0qCHQTBdCH6dQSBhDf0dDH+5dkSqzUNYEij
	uCmdprXjLQS3HbhmED9C8T34UBvYBbEFXmJRbLmhh1zMGnpTIVfFTa26SN2arcI3byja
	3mIOUYW9zkVbzITk/UGwU/elBMFjjWla3BRg7a9T2Y8g0jX1ck52K2GGDjBdruWMuYG1
	qX7Q==
X-Gm-Message-State: ABuFfohkmRL1g/YTewwiFG3pzVJpTDUQ5oWj5UJr7ABObtBkcihIzxuX
	cPSpDTcBlcOdukJlUAWhMj49fx7Py3J91+u0/Huo+g==
X-Google-Smtp-Source: ACcGV638Hk6Akd66jHv7WvIEWsH3605OuK+6QVELNCr50epKao2c6zAu/ngUH5Vll/dyomq1/4YDFE1yiyJbu34ofJY=
X-Received: by 2002:a19:505a:: with SMTP id
	z26-v6mr4172529lfj.120.1539700111972; 
	Tue, 16 Oct 2018 07:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <1539653477-11417-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1539653477-11417-1-git-send-email-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Oct 2018 10:28:20 -0400
Message-ID: <CADkTA4P6r4_+WQ8qfPSyOe8Dd-KwaD5byFE33McRx8HJ6gO6jg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2] libvirt: do not defer postinstall to first boot when not necessary
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
X-List-Received-Date: Tue, 16 Oct 2018 14:28:34 -0000
Content-Type: text/plain; charset="UTF-8"

v2 is merged.

Bruce
On Mon, Oct 15, 2018 at 9:44 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The postinstall invokes `/etc/init.d/populate-volatile.sh update'.
> This is only useful for an on-target package upgrade. For now,
> this postinstall in libvirt has already got a check against $D to
> tell whether it's running on target or not, we do not need to use
> pkg_postinstall_ontarget. Otherwise, we get unnecessary postinstall
> deferred to first boot, which is not what we want.
>
> Note that the postinstall was originally written as 'pkg_postinstall_${PN}',
> but was incorrectly modified to be 'pkg_postinstall_ontarget_${PN}' by the
> following commit.
>
>   """
>   commit 1e67a44db7ec87617455b3228ee5237ceb037173
>   Author: He Zhe <zhe.he@windriver.com>
>   Date:   Tue Jul 24 05:50:01 2018 -0700
>
>       libvirt: Remove unsupported configure options and fix warning
>
>   [snip]
>   """
>
> I think the warning about deferred postinstall was caused by some bbappend
> file instead of the main recipe in this layer.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.7.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
> index 47275ae..ecccfee 100644
> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
> @@ -311,7 +311,7 @@ do_install_ptest() {
>         done
>  }
>
> -pkg_postinst_ontarget_${PN}() {
> +pkg_postinst_${PN}() {
>          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>                  /etc/init.d/populate-volatile.sh update
>          fi
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

