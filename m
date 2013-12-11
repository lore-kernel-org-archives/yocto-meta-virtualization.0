Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7627BE005B1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Dec 2013 18:19:03 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[172.16.1.10]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VqZNQ-0006xX-TT; Wed, 11 Dec 2013 02:18:18 +0000
Message-ID: <52A7CB88.7080209@twobit.us>
Date: Tue, 10 Dec 2013 21:18:48 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1386123634-5877-1-git-send-email-flihp@twobit.us>
	<CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
	<CABZSBQd54bgBVsfW+wq0QH6vcv6oW3OVcE6d2G24EA4U5HQpRw@mail.gmail.com>
	<CADkTA4O0-FYcn=REuwno2UFiDZX++yes892FEOWAsfo5boS9rA@mail.gmail.com>
	<CABZSBQfqAnYkJf9jqtk_hdoj2QN-FrFDsPiVfdXpmTXTPOU49A@mail.gmail.com>
	<CADkTA4PrcYO4vAoQCxYixYfzKK20+A4VKg7rxN5Ts9-Ek0d0JQ@mail.gmail.com>
In-Reply-To: <CADkTA4PrcYO4vAoQCxYixYfzKK20+A4VKg7rxN5Ts9-Ek0d0JQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Break volatiles out into separate package.
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
X-List-Received-Date: Wed, 11 Dec 2013 02:19:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/10/2013 11:29 AM, Bruce Ashfield wrote:
> On Mon, Dec 9, 2013 at 10:17 PM, Chris Patterson <cjp256@gmail.com> wrote:
>> I applied the patch and had a couple notes:
>>
>> - rename pkg_postinst_${PN}-base -> pkg_postinst_${PN}-volatiles.  As it
>> stands, 'populate-volatile.sh update' supposedly only executes when one
>> installs xen-base, but it is only there for handling the volatiles.  In my
>> testing, I don't think this step is required (it doesn't look like it is
>> generating the volatile.cache in the rootfs as I expected) - but it is the
>> common practice from what I've seen.
> 
> I'd agree with this tweak, since it is simple enough to do as part of the merge.
> 
> Phillip: What do you think ? If you want to do a quick repin, I'll wait. If you
> don't have the cycles, but agree, I can make the change as part of the merge.

Thanks. Please include this change as part of the merge.

>> - volatiles indirectly rdepends xen-volatiles now via the script packages. I
>> don't see a problem with this as the job is still getting done - but I
>> wouldn't mind better defining and cleaning up xen-base a bit (or perhaps
>> outright removing it and moving the bits into the appropriate places).
> 
> Also agreed. We can put this on a TODO list.
> 
> Bruce
> 
>>
>> Either way, I'm ok with merging. :)
>>
>> Cheers,
>> -Chris
>>
>>
>> On Mon, Dec 9, 2013 at 12:01 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>>
>>> On Thu, Dec 5, 2013 at 5:20 PM, Chris Patterson <cjp256@gmail.com> wrote:
>>>> Looks good to me.
>>>>
>>>
>>> So to confirm for everyone, no objections if this merges as-is ?
>>>
>>> Bruce
>>>
>>>>
>>>> On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfield
>>>> <bruce.ashfield@gmail.com>
>>>> wrote:
>>>>>
>>>>> On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca <flihp@twobit.us> wrote:
>>>>>> The Xen scripts for handling block and vif udev events depend on
>>>>>> directories created by the Xen volatile directories. In a situation
>>>>>> where the 'base' Xen package isn't installed (NDVM etc) these
>>>>>> scripts fail silently. The most simple approach I could come up
>>>>>> with is just breaking the Xen volatiles config out into it's own
>>>>>> package and setting up the logical dependencies.
>>>>>>
>>>>>> Creating a new package for just a single file seems like overkill
>>>>>> to me but it's the most straightforward thing I could come up with.
>>>>>
>>>>> This seems reasonable to me, there are plenty of other one file package
>>>>> examples (in particular since the update-rc.d only works for one
>>>>> initscript
>>>>> per package), so that isn't all that out of the ordinary.
>>>>>
>>>>> So to my eye, this looks ok.
>>>>>
>>>>> Bruce
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Philip
>>>>>>
>>>>>> Signed-off-by: Philip Tricca <flihp@twobit.us>
>>>>>> ---
>>>>>>  recipes-extended/xen/xen.inc |    8 +++++++-
>>>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/recipes-extended/xen/xen.inc
>>>>>> b/recipes-extended/xen/xen.inc
>>>>>> index 9d43814..e31e996 100644
>>>>>> --- a/recipes-extended/xen/xen.inc
>>>>>> +++ b/recipes-extended/xen/xen.inc
>>>>>> @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
>>>>>>  RDEPENDS_${PN}-scripts-block = "\
>>>>>>      ${PN}-scripts-common \
>>>>>>      ${PN}-udev \
>>>>>> +    ${PN}-volatiles \
>>>>>>      "
>>>>>>
>>>>>>  RDEPENDS_${PN}-scripts-network = "\
>>>>>>      bridge-utils \
>>>>>>      ${PN}-scripts-common \
>>>>>>      ${PN}-udev \
>>>>>> +    ${PN}-volatiles \
>>>>>>      "
>>>>>>
>>>>>>  PACKAGES = "\
>>>>>> @@ -106,6 +108,7 @@ PACKAGES = "\
>>>>>>      ${PN}-scripts-network \
>>>>>>      ${PN}-staticdev \
>>>>>>      ${PN}-udev \
>>>>>> +    ${PN}-volatiles \
>>>>>>      ${PN}-xcutils \
>>>>>>      ${PN}-xencommons \
>>>>>>      ${PN}-xend \
>>>>>> @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
>>>>>>      "
>>>>>>
>>>>>>  FILES_${PN}-base = "\
>>>>>> -    ${sysconfdir}/default/volatiles/99_xen \
>>>>>>      ${sysconfdir}/default/xencommons \
>>>>>>      ${sysconfdir}/default/xendomains \
>>>>>>      ${sysconfdir}/xen/auto \
>>>>>> @@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
>>>>>>      ${sysconfdir}/udev/rules.d/xend.rules \
>>>>>>      "
>>>>>>
>>>>>> +FILES_${PN}-volatiles = "\
>>>>>> +    ${sysconfdir}/default/volatiles/99_xen \
>>>>>> +    "
>>>>>> +
>>>>>>  FILES_${PN}-xcutils = "\
>>>>>>      ${libdir}/xen/bin/lsevtchn \
>>>>>>      ${libdir}/xen/bin/readnotes \
>>>>>> --
>>>>>> 1.7.10.4
>>>>>>
>>>>>> _______________________________________________
>>>>>> meta-virtualization mailing list
>>>>>> meta-virtualization@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>> thee at its end"
>>>>> _______________________________________________
>>>>> meta-virtualization mailing list
>>>>> meta-virtualization@yoctoproject.org
>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>
>>>>
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>
>>
> 
> 
> 


