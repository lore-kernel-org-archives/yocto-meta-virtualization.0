Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EB58E00546; Tue, 22 Nov 2016 12:32:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2CEDE0049F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 12:32:43 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id a10so3410605ywa.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 12:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DsZlTPsmQF9LMPjYbHhwIbKLZpbXzjj2zyRqnQpYbl0=;
	b=JgOLj7izzuu48CBptl6aZZM5ulv++075aarEpzJgPMFcODjOau4deydDiwJWXiD6Sf
	0yhso7iqlAZFj1FwjBAKRKN89Ew2gwfBtm7NTqq7/SpzBr+BPMseJhHDRxml7htahVom
	8FzIIh7p3IpPwPdJvUhVFjbugNJc51YKT4GRLWcr5e5fpACiVp5cqNzD3B9CF05ILjsj
	HfcgXoGA8lLmn+qSKFiS47zTNdI2kKQp3TcsR8b0Z52CKd3dYrs8BZ0iNI4uTCdTsK7E
	1htyErgEnEnzrglAoUzd2Jg2FEnsGIOcVKiUxREydeY+/j1O358keQ3FBvhMHDq4Y5MV
	KFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=DsZlTPsmQF9LMPjYbHhwIbKLZpbXzjj2zyRqnQpYbl0=;
	b=ml8fTpX0mKfAJ+8wgr72xDkWRFM93kNVj7ajAIsxD8XV5VF+IiNh3MvGYFnAJPUKLB
	Jkxe0FUWmN4Qi/PbTKVUqkhrfaLkbQskUjy2cgLYqqXIqeTWgMjK7SLdsh0NE3uUulGJ
	GIeBWgEvPCJcUmAowwbA3EQGddGEtdyC5IWdcrFbtVFQ+FjOZ5ueXPvgpWePVvW8Qnir
	hseQL8A9zXRW7HbUbKb/5L6BhPrKhsCPFVLp8lcYQ5i2do3PDK3Z4RSS4s9Ud4e9qoxT
	aODyFViVgAuAv2i1Oc138QNj08tqPRqy6HRWz8nqIZTPRgEjfFuB5YBS4MlL6rHQdFFo
	gwFg==
X-Gm-Message-State: AKaTC00uuAECIofcMrHUrBwyURCK1Bo3dRAOPj3Q+d/2NA2UIzsgF0+Y2HT9j8KEiRIaYo3cFugAe8QkuWm4ZQ==
X-Received: by 10.129.43.215 with SMTP id r206mr21935282ywr.274.1479846762931; 
	Tue, 22 Nov 2016 12:32:42 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Tue, 22 Nov 2016 12:32:42 -0800 (PST)
In-Reply-To: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 22 Nov 2016 15:32:42 -0500
X-Google-Sender-Auth: _TgBEmJ3C-Jd6Uely21pjaE3d6Q
Message-ID: <CAPuovELZ6ye8k+dDAytYyE6eyNC1i6oyJ784mY9YnioDcO-mBQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/4] improve ability to run multiple dnsmasq instances
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2016 20:32:45 -0000
Content-Type: text/plain; charset=UTF-8

I have some minor changes to cleanup some of the sysvinit stuff out
when using systemd, so I will have a V2 of this changeset. Regardless
please send any review comments to this V1 as what is here is still
valid.

Mark

On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Bruce,
>
> The following are changes to improve the ability to run multiple
> instances of dnsmasq, for instance when lxc and libvirt are both
> installed in an image.
>
> The overall changes are fairly minimal despite the seemingly large
> number of file touches. The biggest of these is moving from
> bind-dynamic to bind-interfaces which is needed to remove some
> ambiguity as to which dnsmasq instance would be responsible for
> listenning on newly created interfaces. If people were making use of
> the dnsmasq automatically listenning on newly created interfaces they
> will potentially have to account for this change, none of the public
> users of meta-virtualization that I know of expect this.
>
> One of the biggest changes reflected in these commits is to avoid
> having any settings in the system/default dnsmasq.conf file, instead
> allowing dnsmasq to run with the default settings built into dnsmasq
> directly. This should allow us to run dnsmasq as the upstream
> community intends. This also allows for easier reuse of the config for
> multiple instances of dnsmasq.
>
> I am sending these changes out now to get feedback but these must only
> be applied after two related changes are merged to meta-openembedded
>
> [PATCH 1/2] dnsmasq: read the conf files found in dnsmasq.d
> [PATCH 2/2] dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf
>
> I will also supply changes to meta-overc which will be required but I
> will only make those changes once I know these are ready for merging.
>
> Regards,
> Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

