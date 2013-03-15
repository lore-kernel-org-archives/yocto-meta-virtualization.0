Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D207DE00770
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Mar 2013 07:39:03 -0700 (PDT)
Received: by mail-lb0-f181.google.com with SMTP id gm6so2794541lbb.26
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Mar 2013 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Ucixx/3GuhOUhnu99HT5KPGcvNGkJgCsrvnCQ1bwXJM=;
	b=e9Ekqf9nsyktg1kXHyV70HDBXfZO7Sy8ful0ngb1+4NEEt4INVViu6MJLqLWEX4Bul
	4EbqABqUtZDXkwJZ3/p4pKkeNiPwCceesXK4oVmOENYzJ2rmguC2WjcMk9gzAEZx0KxE
	0V56OOMIwGX5QxNl4g2ZeRLhsDGASdhuC86ujwCqarOdQzjdnK97938R0jA9ecHqQcXq
	nkMmPNSoiX76Uk56T/j2cTe9Z/A3FjX+7uWZdgrqsBHLPaXLS1gW+Jv21CT/JH8HoO4l
	wqqr80F+NJZkWlq9inyFqlwxudTLZc928xmH9GQorzD0zaH0gWZwp9Y8gDPA+WxKIxMz
	AbrA==
MIME-Version: 1.0
X-Received: by 10.152.47.97 with SMTP id c1mr6009590lan.6.1363358342269; Fri,
	15 Mar 2013 07:39:02 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Fri, 15 Mar 2013 07:39:02 -0700 (PDT)
In-Reply-To: <CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
References: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
	<CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
Date: Fri, 15 Mar 2013 07:39:02 -0700
Message-ID: <CADkTA4NSqeasAR7Q4nK_4pVp1uYfF67=zCSZVLJFQECzCn48xA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Olivia Yin <hong-hua.yin@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: upgrade to 1.0.3
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
X-List-Received-Date: Fri, 15 Mar 2013 14:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 13, 2013 at 6:11 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin <hong-hua.yin@freescale.com> wrote:
>> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
>
> Can you quickly summarize what testing was done with libvirt ? Just
> so we can get a feel for the arches that have been covered, and what
> functionality has been exercised.
>
> Since this patch removes the 1.0 version, we won't have a fallback in
> tree if things break.

ping. There are a few outstanding questions on this. No rush, but
I didn't want anyone to think we were ignoring or had dropped this
series.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>> ---
>>  .../libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>  rename recipes-extended/libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} (97%)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> similarity index 97%
>> rename from recipes-extended/libvirt/libvirt_1.0.0.bb
>> rename to recipes-extended/libvirt/libvirt_1.0.3.bb
>> index 90d7dbb..372e874 100644
>> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> @@ -22,8 +22,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>>         file://libvirtd.sh \
>>         file://libvirtd.conf"
>>
>> -SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
>> -SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
>> +SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
>> +SRC_URI[sha256sum] = "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
>>
>>  inherit autotools gettext update-rc.d
>>
>> --
>> 1.6.4
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

