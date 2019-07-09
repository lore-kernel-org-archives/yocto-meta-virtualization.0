Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDF83E00C46; Tue,  9 Jul 2019 08:15:04 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34216E003E1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jul 2019 08:15:04 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id t28so19922246lje.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jul 2019 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=S1ltbywaC43bwjIfFyMtjbA7vSKFNjeoW31i/6PoF3c=;
	b=npV2pnI/6JwrccWspnJuJj6ivfcyHe06vapx9Sb1t0bg/fnDcQJSPErXVxgjIVVZJH
	ZKw6sa5Nx5v0FKE5qltGna5InFEbY6j0Vd4dkQlmAFx7y3fm4AXKoQAJ6+lNYjH64sRJ
	Y3e9b4iYVrWhM3X/REGc+i5m/l5g6qrGMYtM1nZ9BdxyHZTnl9ketKBQ4br78uqRXjWe
	31fB+BD3L37jPZEOWrR5gfDX6VNTtQh2Iv7C1UYehF6rOZ1kf3bvuXXwptzDW8uVa82S
	3EpwkXqIKZOOTKxMC26Dye8T5xL8K3g5cTXG4tmxhxguxIAXujNnlVDjBKlYMR/tMyvi
	iCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=S1ltbywaC43bwjIfFyMtjbA7vSKFNjeoW31i/6PoF3c=;
	b=o2NrpcxwPxQ1KRsmKIsaKLrmJ0IT4odkbRuL4u87MKJujSM9f/LsrTVYbFPthZLyvk
	0SpeRMp9SeEmkET/UB13uqtXpf6/QDJddCr5U7cCg9A3YYF9yt7BMUvcQAaD/hfWLnIw
	oMUZBycQ1gTRwaBCETL/aGrbFQv6nYU6F9PkC5dLPR/TI9x3MUm0h09sD9IyuJnjmhai
	OoHHjGfWwgmY8h2m2ECaQowD/YTeRcWGcC7zBMuBtDsuOM7SfBwfo0CNkNe8PPmsX9GR
	APc3Bv5cBJwdo2nEj4HNWMEnoCccti762L7vkamfse39x5Z2ImF7OEtfRhtXM8RQ+G7p
	O/QQ==
X-Gm-Message-State: APjAAAUT3VVXxAIRr33pxlG/fvYxjH0c7mm22qzsXxaIr66ZeGFVr92z
	HMPDtmFZzOqp2GAQ1DSG7LRO7MmWl9qWl348rVtcowqFVCI=
X-Google-Smtp-Source: APXvYqxDbgxGAXd4bI9CY317zwKYHjOd7jZUi9EUz+Ff3a0EWA8lhDkvYkFrMNbzyzojQAFh33NXi5u+Co6x+VrjLwg=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr14039107ljj.185.1562685302832; 
	Tue, 09 Jul 2019 08:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4NH3kLuDvpkUbj9VHmtTpAQ8zfRH9A3ctm32cHLvCK5ew@mail.gmail.com>
In-Reply-To: <CADkTA4NH3kLuDvpkUbj9VHmtTpAQ8zfRH9A3ctm32cHLvCK5ew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Jul 2019 11:14:50 -0400
Message-ID: <CADkTA4OE0zXu1ihvhF63FdESQ6thDOjrX56K17hLOK3UUJV_VQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: Heads up on package uprevs dropping in master shortly
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
X-List-Received-Date: Tue, 09 Jul 2019 15:15:05 -0000
Content-Type: text/plain; charset="UTF-8"

Apparently my "shortly" is just over a month of work :D

If anyone cares, I have the updates in master-next in the git repo and
after a bit more testing I'll push them to master.

3304eef libvirt: uprev to 5.5.x
4e8e191 k8s: update to 1.16+
5750a22 k8s: update CNI to 0.7.x
ea6debb cri-o: update to 1.15
1d23f9c containerd: update to 0.2.7
be3fa32 containers: update oci-systemd-hook to 0.2.0
0ea6c85 containers/runtime-spec: update to v1.01
34a6bb9 docker-ce: update to v19.03-rc
a974007 docker/moby: update to v19.03-rc
8a34763 oci-image-tools: refresh to tip of master
103c54f oci-image-spec: uprev to v1.0.1
ee39f1f runc: update to -rc8

Cheers,

Bruce

On Wed, May 29, 2019 at 8:47 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Hi all,
>
> I just wanted to send a quick heads up that I'm finalizing uprev's for
> meta-virt master for the core container components (runc, docker, k8s,
> etc) and I wanted to do a quick survey to see if any users have
> specific version requirements on any of those components.
>
> If there are some stability points that need to be preserved (and
> while also tracking master for some things), I will leave some of the
> existing versions in place when I do the version bumps.
>
> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

