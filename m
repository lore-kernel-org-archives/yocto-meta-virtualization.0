Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D014E009C5; Thu,  6 Aug 2015 06:37:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA4C3E00867
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 06:37:01 -0700 (PDT)
Received: by ykax123 with SMTP id x123so62467014yka.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Aug 2015 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b1ChBKLRs9AXvFWH+lVRX8ud7mQWqW7pCk3/8sJIK+s=;
	b=URyZSpU/De6ZHJ6AYgfd7PtrejHRlKUwjodfL9RMydQJvzkZYNiaOT/iyujtI2uYn2
	EusgFSjlPXrflKul94BTY7pO2iX9aqnCgsao0ujDlGhf3iLcb7I/LqwcvZ/1NwGsMR3W
	riCDsIveqTKHYw6uHJXhl6jo6iVDul/KGMsbVNC8NViL3eTCOuP8qY7nRfcRHbLTUUKv
	J2YyBMinrSnuLCGzweCRgGiaM1V9C4A6fSLGu18Ram/AhHVApit3FVkyoxKfbXk3cn8/
	weugj3yRbog91rvrPbINA+bha3aeeipPnRZLoOvOhcLKVQ011Xl1TKTW3zvXL1jPqLet
	3L3g==
MIME-Version: 1.0
X-Received: by 10.129.114.69 with SMTP id n66mr1502875ywc.102.1438868220625;
	Thu, 06 Aug 2015 06:37:00 -0700 (PDT)
Received: by 10.129.113.69 with HTTP; Thu, 6 Aug 2015 06:37:00 -0700 (PDT)
In-Reply-To: <10602474.99xbkQu933@yow-masselst-d1>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<1438806592-32745-3-git-send-email-mark.asselstine@windriver.com>
	<10602474.99xbkQu933@yow-masselst-d1>
Date: Thu, 6 Aug 2015 09:37:00 -0400
Message-ID: <CADkTA4N4i_r2Zo1OQ5jFqjvss1Qev863+dSwY8iovmwLN5wVnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 02/11] meta-openstack: add wildcard to libvirt bbappend
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
X-List-Received-Date: Thu, 06 Aug 2015 13:37:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 9:37 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On August 5, 2015 16:29:43 Mark Asselstine wrote:
>> This is currently a dangling bbappend as libvirt is now version
>> 1.2.15. The content of the file appears to still be relevant so simply
>> renaming this bbappend to apply to a range of releases. This will
>> throw a warning as no 'sanlock' PKGCONFIG currently exists in the base
>> recipe, a commit will be sent for meta-virtualizaiton to add this.
>
> I might still send a commit for meta-virt to add the sanlock PKGCONFIG but
> there is yet to exist a recipe for sanlock so I might just do a V2 of this
> patch and remove 'sanlock' from the PACKAGECONFIG. Obviously this dangler has
> been dangling for a long time.
>

I just pushed the series. So rebase and send a fixup patch!

Bruce

> Mark
>
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  .../recipes-extended/libvirt/libvirt_1.%.bbappend           | 13
>> +++++++++++++ .../recipes-extended/libvirt/libvirt_1.2.12.bbappend        |
>> 13 ------------- 2 files changed, 13 insertions(+), 13 deletions(-)
>>  create mode 100644
>> meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend delete mode
>> 100644 meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend
>>
>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
>> b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend new file
>> mode 100644
>> index 0000000..195633b
>> --- /dev/null
>> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
>> @@ -0,0 +1,13 @@
>> +PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
>> +              python sanlock ebtables \
>> +              ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> +             "
>> +
>> +inherit useradd
>> +USERADD_PACKAGES = "${PN}"
>> +GROUPADD_PARAM_${PN} = "--system libvirt"
>> +
>> +do_install_append() {
>> +     sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i
>> ${D}/etc/libvirt/libvirtd.conf +      sed -e "s:^#unix_sock_rw_perms
>> =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf +}
>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend
>> b/meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend deleted
>> file mode 100644
>> index 195633b..0000000
>> --- a/meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
>> -              python sanlock ebtables \
>> -              ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> -             "
>> -
>> -inherit useradd
>> -USERADD_PACKAGES = "${PN}"
>> -GROUPADD_PARAM_${PN} = "--system libvirt"
>> -
>> -do_install_append() {
>> -     sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i
>> ${D}/etc/libvirt/libvirtd.conf -      sed -e "s:^#unix_sock_rw_perms
>> =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf -}
>> --
>> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

