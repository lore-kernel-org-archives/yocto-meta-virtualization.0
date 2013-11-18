Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91EFBE002AC
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Nov 2013 05:58:56 -0800 (PST)
Received: by mail-la0-f44.google.com with SMTP id ep20so4967298lab.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Nov 2013 05:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bqFlx19P9SfOHKs3CD3c4YnA+AC4ru2ZzFYwibL2n8Y=;
	b=N6WaKzmi6xAmu/CRuzJ+szLyTOankjTRWa6DYsv289GgthmyftnbjyRc/Jwr6j0hjn
	qqNaSO80rYKY8n8m2a8M+KhBkRhx2/KBrsuQ6apgFvJnxaeDwpIFg4OjIT+5z6Ll/sh7
	V1g2IaA50FZX6MK/xaxm64g/LE+u74TAC5bvnzGpXo3aMnzhUJX+OuS3pdN0L3LQZOQ0
	Y57H5edTGOZ+vAgJIJaynjzEMq/wZmicLsilrpfLHY68Sc5fB6hgfmC8I5kIYsSnx7Ck
	7jfnNi6vyDO0/28zhimmrWRnBu2KnbOME/BbbZFuaBIGB8gtdD5KbrTgO7X4WLMGchGb
	jxnA==
MIME-Version: 1.0
X-Received: by 10.152.181.98 with SMTP id dv2mr5977428lac.15.1384783135324;
	Mon, 18 Nov 2013 05:58:55 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Mon, 18 Nov 2013 05:58:55 -0800 (PST)
In-Reply-To: <CABZSBQeNOp6A0gxTVEA6DsF8E+Ovho5DaDkr4eJsszP=Bz5E9g@mail.gmail.com>
References: <CADkTA4OKxUpKr=0mqFREY9UCTWfAoG3QJwFft481rOwLc_cL7w@mail.gmail.com>
	<CABZSBQeNOp6A0gxTVEA6DsF8E+Ovho5DaDkr4eJsszP=Bz5E9g@mail.gmail.com>
Date: Mon, 18 Nov 2013 08:58:55 -0500
Message-ID: <CADkTA4Ps864Dofu_vOoV4+deiLKPp_kY8hrWEy6M6gVUXoiJRg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Xen Query ...
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
X-List-Received-Date: Mon, 18 Nov 2013 13:58:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 17, 2013 at 3:58 PM, Chris Patterson <cjp256@gmail.com> wrote:
> I did a couple of fresh builds yesterday against oe-core master without
> issue (I do this pretty regularly...).
>

Excellent. First rule of debugging: if you see an error that is so
fundamental that
no one could possibly build .. assume that your environment is completely
tainted. Which was my starting assumption :)


> For the two distros that I build, they share:
> DISTRO_FEATURES_append = " tpm txt usb3 xen opengl aufs "
>
> Another build I do extends that even further.  They are regularly updated to
> master on oe-core/meta-oe/meta-intel/meta-virtualization/meta-measured.
>
> As another test, I took my existing "vanilla" build tree (nodistro, no
> additional flags), created a new distro config and built xen-image-minimal:
>
> oe-xen.conf:
> DISTRO = "oe-xen"
> DISTROOVERRIDES = ""
> DISTRO_FEATURES_append = " xen aufs "
>
> eglibc and the image built OK.
>
> Then, in the same build tree, I went back to nodistro, with the same
> DISTRO_FEATURES_append instead placed into local.conf.  eglibc and the image
> built OK.
>
> I will note that on occasion, I have seen the rare oddball errors (eglibc
> sounds like a familiar one, but couldn't say for sure) - usually after a
> substantial fetch and/or layer changes.  I've gone into the rabbit hole on a
> couple of them without much success.  In all cases, wiping out
> tmp/cache/sstate and starting fresh fixed the issues for me.

And the same thing with me. I've hit a few of these over the years, and when
the c library and toolchain builds go bad, I've never been able to sort them out
with clean and rebuilds. Only a full removal of tmp/. This time, I thought I'd
try and sort it out.

>
> Out of curiosity, what's the error you are seeing?

Here's the last snippet of the error:

86_64-poky-linux/eglibc/2.18-r0/build-x86_64-poky-linux/libc_pic.os:
relocation R_X86_64_PC32 against undefined hidden symbol
`__nss_not_use_nscd_group' can not be used when making a shared object
| /home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux.gcc-cross-initial/gcc/x86_64-poky-linux/4.8.1/ld:
final link failed: Bad value
| collect2: error: ld returned 1 exit status
| make[2]: *** [/home/bruce/poky/build/tmp/work/x86_64-poky-linux/eglibc/2.18-r0/build-x86_64-poky-linux/libc.so]
Error 1
| make[2]: Leaving directory
`/home/bruce/poky/build/tmp/work/x86_64-poky-linux/eglibc/2.18-r0/eglibc-2.18/libc/elf'
| make[1]: *** [elf/subdir_lib] Error 2
| make[1]: Leaving directory
`/home/bruce/poky/build/tmp/work/x86_64-poky-linux/eglibc/2.18-r0/eglibc-2.18/libc'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.


Cheers,

Bruce

>
> Cheers,
> -Chris
>
> On Sat, Nov 16, 2013 at 10:42 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> Hi all,
>>
>> Just sending a question to see who else is building Xen from
>> meta-virtualization
>> master against yocto/oe-core master ?
>>
>> All my builds have been failing on eglibc after adding xen and aufs to
>> the DISTRO_FEATURES.
>> I've worked around the problem and converted them to IMAGE_FEATURES to get
>> full
>> functionality, but I'm wondering if anyone else has seen this .. I
>> want to rule out my
>> build machine, and it being a one-off, before I dig any deeper.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

