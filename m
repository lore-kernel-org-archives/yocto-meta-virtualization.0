Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 986C4E006C7
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Dec 2013 04:45:31 -0800 (PST)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VnpLQ-0000xT-VT; Tue, 03 Dec 2013 12:44:53 +0000
Message-ID: <529DD262.2020302@twobit.us>
Date: Tue, 03 Dec 2013 07:45:22 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1385471335-32126-1-git-send-email-flihp@twobit.us>
	<CADkTA4On0GwsQ+POK62aaCXExCLR+UN-fFJJy-+k4fW9rcX5nQ@mail.gmail.com>
In-Reply-To: <CADkTA4On0GwsQ+POK62aaCXExCLR+UN-fFJJy-+k4fW9rcX5nQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 216.57.91.130
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] base-files: add xenfs entry to fstab if xen DISTRO_FEATURE is enabled
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
X-List-Received-Date: Tue, 03 Dec 2013 12:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thanks Bruce.

Philip

On 12/03/2013 12:57 AM, Bruce Ashfield wrote:
> Hey Phillip,
> 
> It appears that I forgot to follow up on this. I was working up upreving libvirt
> and grabbed this into my tree. I'll push this shortly, since libvirt is nearly
> done :)
> 
> Bruce
> 
> On Tue, Nov 26, 2013 at 8:08 AM, Philip Tricca <flihp@twobit.us> wrote:
>> Xen handles mounting xenfs with an init script. Unfortunately this
>> script is the same one that starts xenstored and xenconsoled. That's
>> great for dom0 but a domU may need xenfs but running xenstored/
>> xenconsoled in a domU makes no sense. A simple fstab entry is
>> preferrable.
>>
>> Signed-off-by: Philip Tricca <flihp@twobit.us>
>> ---
>>  recipes-core/base-files/base-files_3.0.14.bbappend |    5 +++++
>>  1 file changed, 5 insertions(+)
>>  create mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
>>
>> diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
>> new file mode 100644
>> index 0000000..eb973ad
>> --- /dev/null
>> +++ b/recipes-core/base-files/base-files_3.0.14.bbappend
>> @@ -0,0 +1,5 @@
>> +do_install_append() {
>> +       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
>> +               echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
>> +       fi
>> +}
>> --
>> 1.7.10.4
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 


