Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 949E5E00B58; Thu, 18 Apr 2019 06:10:15 -0700 (PDT)
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
	*      [209.85.208.176 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B88AE0096F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:10:14 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id t4so1896491ljc.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XglLtS8S839/XSRj/RseisZpvD6L1VLnPEgLDysKPOk=;
	b=GgFIYWCirOmfkbxBqufZWU2PGTLrIh7FYbKp5E1F+ltnstETfetFAwfQHQJWxcYAAc
	L+ywov1eE6VbHHxEHbEp7IKFD2xVqqGtvuqwf/BZT7sPX1BLPzZAlTPXCiCoXDW8YnpF
	IB8QwGzZet1Wx019XvmxzpiXmSdJGY2BV4VGCgEatpCMx5oWByKirfiTmZIr8CjMkK4b
	O1JXLkbICYEGUIG8G8/+A/l9SqkX5M6NolObhIl7DTY+rtcqsAFYQZD9EXsDoykJYkV8
	lg+NQAe3NctyEFTRPVUd3LxidWzc+/0eAU5+Ea/m40fIxMT+hbX4stNHzVuTS7RwWD4p
	7+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XglLtS8S839/XSRj/RseisZpvD6L1VLnPEgLDysKPOk=;
	b=GbFj3k3pl7s+2MNtv/Gdd9Stiuky2FUoiZtrcImhkczQVrwYwS4HLgE1yqF9jgd2l1
	bu65nj7cU2mjt4EifBk8DdNR8IodHTcLeRELNAMKLDxuUwwXajtsF5neuGJwOtNqKHN0
	pnJwSN2QAwbt6NE5rGLvsEiMKpt1Fxt/h02OA56XvxIXWHPk4U5/oBFPCECkvnGoFtKG
	afb+7UCBIRnw0R4+Qvx/vDopkgnpDAKb8K9xDzGNonBGKeBWVUdCWd4UBIdrl3sOAW6U
	db/UUhMY9/1L33i8oQEBhVowdEa6vPMmmHvp01ffQm02ujaLO7CVWYjnn0Tz3i8EtYT3
	P8Rw==
X-Gm-Message-State: APjAAAUEvAz4aOr4xZwQovSrKgqIsTxYhIzfIj8hv+dOhwgHeqDnlcG5
	WhZAGZkwtbTVMPYimaalhLnXCFLpEDZTMP+uO1k=
X-Google-Smtp-Source: APXvYqwWyJuMKPzEGFmBRyornB70Ok6EXBLO+iOlZ+kzHJu90kWBquu9ez36dHbAD6rDwBvhh35905Uw4Z9EwNaeVbg=
X-Received: by 2002:a2e:9719:: with SMTP id r25mr10990880lji.29.1555593013856; 
	Thu, 18 Apr 2019 06:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <CACMJ4GbOz4U6Uj-7ZLpggrrrAhxCw25EH80RiR3Gq7aDYJM2BQ@mail.gmail.com>
In-Reply-To: <CACMJ4GbOz4U6Uj-7ZLpggrrrAhxCw25EH80RiR3Gq7aDYJM2BQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Apr 2019 09:10:02 -0400
Message-ID: <CADkTA4NYtH9KhO7uvmJp3L=mecU9aeMRVHk0Uba2dTY=3J7R5g@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: thud backport request: ipxe build fix
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
X-List-Received-Date: Thu, 18 Apr 2019 13:10:15 -0000
Content-Type: text/plain; charset="UTF-8"

cherry pick complete

Bruce

On Wed, Apr 17, 2019 at 4:43 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> Please could the following ipxe build fix be cherry-picked from master
> into the thud branch.
>
> commit 4cbd6c2b467c1f4caa32b2f782072739ab373065
> Author: Christopher Clark <christopher.w.clark@gmail.com>
> Date:   Wed Feb 20 16:52:03 2019 -0800
>
>     ipxe: Uprev and fix host compiler and linker flags.
>
> thanks
>
> Christopher
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

