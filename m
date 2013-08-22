Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 22943E00747
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Aug 2013 00:55:44 -0700 (PDT)
Received: from [172.16.141.168] (172.16.141.168) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 22 Aug 2013 09:55:41 +0200
Message-ID: <5215C3F6.5040000@enea.com>
Date: Thu, 22 Aug 2013 09:55:34 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1377094573-30072-1-git-send-email-david.nystrom@enea.com>
	<CADkTA4NHoDDeP1C262yZ=dj3+eqJUa2vuBw4xPHLiN4exnhfVQ@mail.gmail.com>
In-Reply-To: <CADkTA4NHoDDeP1C262yZ=dj3+eqJUa2vuBw4xPHLiN4exnhfVQ@mail.gmail.com>
X-Originating-IP: [172.16.141.168]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fixed Q&A error for OpenFlow recipe
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
X-List-Received-Date: Thu, 22 Aug 2013 07:55:45 -0000
X-Groupsio-MsgNum: 377
Content-Type: multipart/mixed; boundary="------------030200080700010205020201"

--------------030200080700010205020201
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

$ bitbake openflow
WARNING: Host distribution "Ubuntu-13.10" has not been validated with 
this version of the build system; you may possibly experience unexpected 
failures. It is recommended that you use a tested distribution.
Loading cache: 100% 
|######################################################################| 
ETA:  00:00:00
Loaded 1727 entries from dependency cache.
Parsing recipes: 100% 
|####################################################################| 
Time: 00:00:00
Parsing of 1336 .bb files complete (1335 cached, 1 parsed). 1726 
targets, 38 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.19.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-13.10"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "qemux86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.4+snapshot-20130822"
TUNE_FEATURES     = "m64"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = "master:b2ff1add530b1fec2fb7f385227a03db47015c37"
meta-oe
meta-networking   = "master:d4571b3d94d999ad54d8965f0d049dcfd34da504"
meta-virtualization = "master:ef0700820686d262fa28091b8e143fc881f69965"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: QA Issue: openflow: Files/directories were installed but not shipped
   /run
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: 
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/temp/log.do_package.14523
ERROR: Task 10 
(/media/sdb5/eel/meta-virtualization/recipes-networking/openflow/openflow_1.0.bb, 
do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 578 tasks of which 576 didn't need to be 
rerun and 1 failed.
No currently running tasks (577 of 582)

Summary: 1 task failed:
 
/media/sdb5/eel/meta-virtualization/recipes-networking/openflow/openflow_1.0.bb, 
do_package
Summary: There was 1 WARNING message shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.


Br,
David



On 08/22/2013 02:54 AM, Bruce Ashfield wrote:
> Can you dump the QA recipe here for the long log ? I've been building this and
> haven't seen it myself. So I'm curious to see what it is .. with it in
> the commit log,
> I'll know if I see it.
>
> On Wed, Aug 21, 2013 at 10:16 AM, David Nyström
> <david.c.nystrom@gmail.com> wrote:
>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>> ---
>>   recipes-networking/openflow/openflow_1.0.bb | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-networking/openflow/openflow_1.0.bb b/recipes-networking/openflow/openflow_1.0.bb
>> index 3663e50..20a2bc9 100644
>> --- a/recipes-networking/openflow/openflow_1.0.bb
>> +++ b/recipes-networking/openflow/openflow_1.0.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "OpelFlow"
>> +SUMMARY = "OpenFlow"
>
> I for one liked the OpelFlow support! :)
>
>>   DESCRIPTION = "Provide a generic framework for handling devices in userspace."
>>   HOMEPAGE = "http://www.openflow.org"
>>   SECTION = "networking"
>> @@ -21,4 +21,9 @@ PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
>>
>>   S = "${WORKDIR}/git"
>>
>> -inherit autotools
>> \ No newline at end of file
>> +inherit autotools
>> +
>> +do_install_append() {
>> +       # Remove /var/run as it is created on startup
>> +        rm -rf ${D}${localstatedir}/run
>> +}
>
> Indeed .. this will get populated without OpenFlow's help.
>
> Bruce
>
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>

--------------030200080700010205020201
Content-Type: text/plain; charset="UTF-8"; name="log.do_package.14523"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="log.do_package.14523"

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_package
DEBUG: Executing python function package_get_auto_pr
DEBUG: Python function package_get_auto_pr finished
DEBUG: Executing python function perform_packagecopy
DEBUG: Python function perform_packagecopy finished
DEBUG: Executing python function split_and_strip_files
DEBUG: runstrip: 'x86_64-poky-linux-strip' --remove-section=.comment --remove-section=.note '/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/package/usr/bin/ofprotocol'
DEBUG: runstrip: 'x86_64-poky-linux-strip' --remove-section=.comment --remove-section=.note '/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/package/usr/bin/ofp-kill'
DEBUG: runstrip: 'x86_64-poky-linux-strip' --remove-section=.comment --remove-section=.note '/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/package/usr/bin/ofdatapath'
DEBUG: runstrip: 'x86_64-poky-linux-strip' --remove-section=.comment --remove-section=.note '/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/package/usr/bin/controller'
DEBUG: runstrip: 'x86_64-poky-linux-strip' --remove-section=.comment --remove-section=.note '/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/package/usr/bin/dpctl'
DEBUG: runstrip: 'x86_64-poky-linux-strip' --remove-section=.comment --remove-section=.note '/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/package/usr/bin/ofp-discover'
DEBUG: Python function split_and_strip_files finished
DEBUG: Executing python function fixup_perms
DEBUG: Python function fixup_perms finished
DEBUG: Executing python function package_do_split_locales
DEBUG: No locale files in this package
DEBUG: Python function package_do_split_locales finished
DEBUG: Executing python function populate_packages
ERROR: QA Issue: openflow: Files/directories were installed but not shipped
  /run
DEBUG: Python function populate_packages finished
DEBUG: Executing python function do_package_qa
NOTE: DO PACKAGE QA
NOTE: Checking Package: openflow-dbg
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/controller
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/vlogconf
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/ofdatapath
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/ofprotocol
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/ofp-discover
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/dpctl
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow-dbg/usr/bin/.debug/ofp-kill
NOTE: Checking Package: openflow-staticdev
NOTE: Checking Package: openflow-dev
NOTE: Checking Package: openflow-doc
NOTE: Checking Package: openflow-locale
NOTE: Checking Package: openflow
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/controller
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/vlogconf
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/ofdatapath
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/ofprotocol
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/ofp-discover
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/dpctl
NOTE: x86_64-poky-linux-objdump -p /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+5ccca75a69-r0/packages-split/openflow/usr/bin/ofp-kill
ERROR: QA run found fatal errors. Please consider fixing them.
DEBUG: Python function do_package_qa finished
DEBUG: Python function do_package finished
ERROR: Function failed: do_package_qa

--------------030200080700010205020201--
