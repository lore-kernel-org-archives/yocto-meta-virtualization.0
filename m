Return-Path: <asselsm@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38E21E0071F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 09:11:18 -0700 (PDT)
Received: by mail-ie0-f175.google.com with SMTP id a11so15713841iee.20
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=TJl1rz+H2cGkR9Ojq3UNTvchnsO4GnXRlD5u6gu5OVU=;
	b=sjKcsdn/S9mzIG0xW3yAFhmaevUswLtHlZ6iDWDJxAJ0wofjgJr+G9d2XhQA8Nnxkz
	ooKaUHGzI28lCp21QEHITfdhjwQkZfJOegt0j035C5nYSVh7QgwFwA3l3TKPV5pxBozQ
	UvZuvYCgORP56PL0lBhUgI1O18EzUvXGT2v1Ay3O3Rbg+B+gs9cgB4WUhOIAdOZZ9RGe
	3bKynbDfk0Vbgax5iJNChHcF7JZ7HrMKmE+mLyOAPdL7vXhhSS/0bA5q3OoIy3q7UEm9
	X5sJj9bF3L4NvONnGmN9KhEyhfxvs0P4Y4sgB6VRvGYVpw8nWk5SAIi1w+LXeH1Xt0Jn
	X3lg==
MIME-Version: 1.0
X-Received: by 10.50.50.2 with SMTP id y2mr3157025ign.25.1373731878064; Sat,
	13 Jul 2013 09:11:18 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.43.53.212 with HTTP; Sat, 13 Jul 2013 09:11:17 -0700 (PDT)
In-Reply-To: <1373731766-7117-1-git-send-email-mark.asselstine@windriver.com>
References: <1373731766-7117-1-git-send-email-mark.asselstine@windriver.com>
Date: Sat, 13 Jul 2013 12:11:17 -0400
X-Google-Sender-Auth: avmZHFfpJVi65luGP3-5j_68Xco
Message-ID: <CAPuovEKY512EbBBd2xuXkS3j+xtCBZsX=mzb0FOXkQS7VBUCLw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Revert "kvm: Make lapic hrtimer irq safe"
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
X-List-Received-Date: Sat, 13 Jul 2013 16:11:19 -0000
Content-Type: text/plain; charset=UTF-8

Sent the wrong patch. My apologies. Please ignore this.

Mark

On Sat, Jul 13, 2013 at 12:09 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> This reverts commit 5345ad1661edb624aeca87f5fb08abccd4414f68.
>
> Conflicts:
>         arch/x86/kvm/lapic.c
> ---
>  arch/x86/kvm/lapic.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 671aa5d..8c26c63 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -1037,13 +1037,9 @@ static void start_apic_timer(struct kvm_lapic *apic)
>                         }
>                 }
>
> -again:
> -               if (hrtimer_start(&apic->lapic_timer.timer,
> -                                 ktime_add_ns(now, apic->lapic_timer.period),
> -                                 HRTIMER_MODE_ABS) == -ETIME) {
> -                       if (apic_timer_fn(&apic->lapic_timer.timer) == HRTIMER_RESTART)
> -                               goto again;
> -               }
> +               hrtimer_start(&apic->lapic_timer.timer,
> +                             ktime_add_ns(now, apic->lapic_timer.period),
> +                             HRTIMER_MODE_ABS);
>
>                 apic_debug("%s: bus cycle is %" PRId64 "ns, now 0x%016"
>                            PRIx64 ", "
> @@ -1562,7 +1558,6 @@ int kvm_create_lapic(struct kvm_vcpu *vcpu)
>         hrtimer_init(&apic->lapic_timer.timer, CLOCK_MONOTONIC,
>                      HRTIMER_MODE_ABS);
>         apic->lapic_timer.timer.function = apic_timer_fn;
> -       apic->lapic_timer.timer.irqsafe = 1;
>         apic->lapic_timer.t_ops = &lapic_timer_ops;
>         apic->lapic_timer.kvm = vcpu->kvm;
>         apic->lapic_timer.vcpu = vcpu;
> --
> 1.8.1.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

