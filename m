Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1676BE00AD8; Wed, 23 Mar 2016 07:10:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.178 listed in list.dnswl.org]
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5E6EE009D7;
	Wed, 23 Mar 2016 07:10:07 -0700 (PDT)
Received: by mail-ob0-f178.google.com with SMTP id m7so13506593obh.3;
	Wed, 23 Mar 2016 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/BbxB6N+j4XeGxfZS8JI2dUl8GLa9YPzQ+JqI7NDTYM=;
	b=xn9xU/fWZ0nnuK7rlQDSXURqpqOcSSxGWtS7dBSiq5AXqybwBcHaqVDUYEAJNK1DmK
	7uBeWc5rFg3KB9/Cgw0ZYn1GMS7GgeJuT/mWGjZAIBpivB6+KtPvqhaGXzNBC11lvqBU
	ZyHtqudeZzI/jbv/jv5lXH2+1RriuDbRAYe5ZNlbivqqp8iak9S5JIjdUzdhKtc7pZNj
	jMtfHeAA+mxndkpBfct641GbJAyJBuOVz8h7MKrecYbbazU4YcJPeL20aPtM0QHQ8Kkv
	vRD09BjHJtRAPvGF1l4Vu8lrQ9ImFoFp1GI+qCL2Zr84ibsVKiaL5I8j4YB2617ypXrb
	VW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/BbxB6N+j4XeGxfZS8JI2dUl8GLa9YPzQ+JqI7NDTYM=;
	b=VBTJC/4zddrqb25pVPF841WeEq+MsyK/GeZrO9pbIlBQArBdcJM/yQAiM3LvZ4QFYz
	vDadbp1ybMahS39GhEM69Fsam0mCOjbIuJvyuwWxn9ZVtXj++YCIha/38iERuiylk4GX
	ai4zR+X6ld27k0kbAlZmYPzKu68RxuE9EFeTv65zO5+DeQ9FRAOJxccS7EkiZi6xVb/s
	yp2b7i2vF8kYwHFqERPq3JUwfX1LTd4Y+dFqbI/H8AjzsFTigK0vKpkyGZ74TQPxfS0v
	NS73WSATF+/5ssjYHzQN8YISn4ivjuGIa+4oRoLqDEEhJu9nS5vvmZrfTwopdOVFhKV0
	Z+Dw==
X-Gm-Message-State: AD7BkJJYf/hnBtma6Qcr3NqPW6wEYeKbeMHFARCbKdXIZYd1syXQIp+18klYR4l7TBqzL1LBRHCEjgzblVKJ+Q==
X-Received: by 10.60.39.105 with SMTP id o9mr1555355oek.31.1458742206820; Wed,
	23 Mar 2016 07:10:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Wed, 23 Mar 2016 07:09:47 -0700 (PDT)
In-Reply-To: <d5ba2b9811994d2dbfe58a1e46e7721a@SI-MBX1022.de.bosch.com>
References: <d5ba2b9811994d2dbfe58a1e46e7721a@SI-MBX1022.de.bosch.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Wed, 23 Mar 2016 10:09:47 -0400
Message-ID: <CABZSBQcgfuZ6_+6WnPhBTX7vDz0vJpWBMtZLMb+ZJ72qd04DNw@mail.gmail.com>
To: "Olsson Rikard (RBSN/ESW1)" <Rikard.Olsson@se.bosch.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [yocto] Question about XEN-hypervisor and Yocto build system
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
X-List-Received-Date: Wed, 23 Mar 2016 14:10:22 -0000
Content-Type: text/plain; charset=UTF-8

(CCing meta-virtualization)

On Wed, Mar 23, 2016 at 8:46 AM, Olsson Rikard (RBSN/ESW1)
<Rikard.Olsson@se.bosch.com> wrote:
> Hello Yocto Members,
>
> I am looking into xen-hypervisor and have downloaded the meta-virtualization layer and updated bblayers.conf to pull in the layer. However I am unsure how to proceed:
> 1) How do I configure the meta-virtualization to use Xen hypervisor

You will need to add "xen" to your DISTRO_FEATURES to toggle on the
yocto kernel config fragment for xen support, as well as libvirt.

> 2) What target do I build/bb file do I build.
>
> I usually build either:
> bitbake core-image-minimal ==> Standard Linux for our HW board
> bitbake core-image-XXX--XXX ==> Standard Linux for our HW board + additional application layers.
>
> I am however unable to understand the connection between the images I currently build and the Xen-hypervisor, for example:
> recipes-extended/libvirt/libvirt_1.2.19.bb:# xen-minimal config
> recipes-extended/images/kvm-image-minimal.bb:DESCRIPTION = "A minimal kvm image"
> recipes-extended/images/xen-image-minimal.bb:DESCRIPTION = "A minimal xen image"
> What are above bitbake recipes, should I build xen-image-minimal.bb instead of core-image-minimal or....
>

This largely depends on what you are trying to do, your BSP, if you
are using the yocto kernel, etc..  Building xen-image-minimal should
provide a bootable dom0 out of the box (at least for typical x86-64)
that can start/stop VMs using xl toolstack (not libvirt).

Adding xen support is largely about getting the appropriate kernel
bits enabled (meta-virtualization provides a config fragment).  For
dom0, you will also need to configure your bootloader to boot xen, and
then you will need to add the packages you desire (qemu, libvirt,
xen-base, etc.) to your specific image.

Good luck!

