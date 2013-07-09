Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B37DE01405
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jul 2013 20:08:20 -0700 (PDT)
Received: by mail-la0-f54.google.com with SMTP id ec20so4401814lab.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jul 2013 20:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7gNIzubkXfB43XZYlfkIf2YVXExGL8b4JWea7PJMXVk=;
	b=CJ+bvQoRfPyEdvmKVKQQ1t7o7ah+w5zf/Y64lF8eVznzKLBTsUFK6DqaR5ktZKSUyn
	J87oL45he9rtp86bEMQDDYqRxv8RGJyPhfU3ZD6QbSGdAkrWGZF0zzy2+itk7KOLVoVv
	D4pNgd+X//X31gb+g7s5PktK3xPLr1wrN1kOlny6UpyBqmYj/3v4h6LAgKR1Ts1qGsY+
	HUjabBC+/hGMA65pOhW5uln5oHR2xLe2RiTtODQY9fsZN+qYkqMxjuHlEoVLuQ7T678n
	cVIwvdfW0xnnWikbS/On4XBENqFFLiFZzLIlOd/3dLpGqFf5ETtEs5SUv9sxNJ1zEmk0
	vnWQ==
MIME-Version: 1.0
X-Received: by 10.112.168.132 with SMTP id zw4mr12061732lbb.79.1373339298849; 
	Mon, 08 Jul 2013 20:08:18 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Mon, 8 Jul 2013 20:08:18 -0700 (PDT)
In-Reply-To: <1373292676-13405-1-git-send-email-mihai.prica@intel.com>
References: <1373292676-13405-1-git-send-email-mihai.prica@intel.com>
Date: Mon, 8 Jul 2013 23:08:18 -0400
Message-ID: <CADkTA4P130WhL4QFEGnPpzQi8YoJqJVuZJ9kp-Sz+f+_o99iZw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] linux-yocto: Added 3.8 kernel bbappend
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
X-List-Received-Date: Tue, 09 Jul 2013 03:08:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 8, 2013 at 10:11 AM, Mihai Prica <mihai.prica@intel.com> wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>

merged.

Bruce

> ---
>  recipes-kernel/linux/linux-yocto_3.8.bbappend |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> new file mode 100644
> index 0000000..2893a01
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> @@ -0,0 +1,13 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://xt-checksum.scc \
> +            file://ebtables.scc \
> +           file://vswitch.scc \
> +           file://lxc.scc \
> +           "
> +module_autoload_openvswitch = "openvswitch"
> +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> +
> +module_autoload_kvm = "kvm"
> +module_autoload_kvm-amd = "kvm-amd"
> +module_autoload_kvm-intel = "kvm-intel"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

