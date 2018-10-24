Return-Path: <Randy.MacLeod@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF26FE00AD8; Wed, 24 Oct 2018 12:49:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C306E00994
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Oct 2018 12:49:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9OJnDVm017272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Oct 2018 12:49:24 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 24 Oct 2018 12:49:02 -0700
To: Ken Bassford <kbassford@apertussolutions.com>
References: <166a67a004c.1185091d4239486.5035650420418090611@apertussolutions.com>
	<4d5b4b3d-0881-965c-b56a-d778a33437e0@windriver.com>
	<166a792f5e4.1082e3d49287565.8933791861338451987@apertussolutions.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a6ebe150-0f25-c20c-d544-4c4e105ac342@windriver.com>
Date: Wed, 24 Oct 2018 15:49:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <166a792f5e4.1082e3d49287565.8933791861338451987@apertussolutions.com>
X-Originating-IP: [172.25.44.4]
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: ipxe: do_compile failing on rocko
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
X-List-Received-Date: Wed, 24 Oct 2018 19:49:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/24/18 3:35 PM, Ken Bassford wrote:
> Hi Randy,
> 
> Took me a while as I had edited outside of git.
> 
> Got all the way down to the "git send-email" command.
> 
> "git: 'send-email' is not a git command. See 'git --help'"
> Sorry, I thought I could save you the trouble.

I will teach you to fish! :)

You need the git-email package on Ubuntu at least.

I kind of knew that but I confirmed using:
$ git send-email --dry-run ...
with strace:
$ strace -f -o /tmp/gse.log git send-email --dry-run ...

$ grep exec /tmp/gse.log | grep send-email | me-filtering-details
...
.../usr/lib/git-core/git-send-email...
...

so checking that package:
$ dpkg -S /usr/lib/git-core/git-send-email
git-email: /usr/lib/git-core/git-send-email


Can you install that package and try again?
Don't forget about the git setup steps in:
   https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

If you get stuck, let me know.

../Randy


> 
> Sincerely,
> Ken Bassford
> Apertus Solutions
> 
>   ---- On Wed, 24 Oct 2018 14:54:14 -0400 Randy MacLeod <randy.macleod@windriver.com> wrote ----
>   > On 10/24/18 10:28 AM, Ken Bassford wrote:
>   > > Hello again,
>   > >
>   > > Found another bug ...
>   > >
>   > > Received in log "...poky/build/tmp/work/core2-64-poky-linux/ipxe/gitrAUTOINC+8c43891db4-r0/temp/log.do_compile"
>   > >
>   > > Assembler messages:
>   > > "/tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'
>   > >
>   > > /tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'"
>   > >
>   > > Change to ipxe_git.bb that enabled compile to work.
>   >
>   > You've shown the error, that's good. It should go in the body / long log
>   > of you git commit message.
>   >
>   > You also need to explain why this change makes sense.
>   > In this case you can just point to the commit on master by saying:
>   >
>   > Set the isolinux bin variable used in Makefile as was done on
>   > master in commit:
>   >     fd68542 ipxe: recipe cleanup and uprev to current
>   >
>   > >
>   > > - #EXTRA_OEMAKE = "NO_WERROR=1"
>   > > + EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}""
>   >
>   > Ken,
>   >
>   > Would you be able to re-submit as a patch as I did and
>   > explained for the SRC_URI change for seabios for morty?
>   >
>   > Thanks,
>   > ../Randy
>   > >
>   > > [reply] [-] Comment 1 Randy MacLeod 2018-10-24 14:19:29 UTC
>   > > Hi Ken and other meta-virt users who may read this defect,
>   > >
>   > > as you realize, ipxe is from:
>   > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/ipxe/ipxe_git.bb?h=master
>   > >
>   > > meta-virtualization doesn't use the YP bugzilla.
>   > > As it says in the meta-virt README:
>   > >
>   > > Maintenance
>   > > -----------
>   > >
>   > > Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
>   > >
>   > > Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com>
>   > >
>   > > When sending single patches, please using something like:
>   > > $ git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
>   > >
>   > > ---------------------------------------------
>   > >
>   > > meta-virt is welcome to use bugzilla but they have decide to just use the email list.
>   > >
>   > > Sincerely,
>   > > Ken Bassford
>   > > Apertus Solutions
>   > >
>   > >
>   >
>   >
>   > --
>   > # Randy MacLeod
>   > # Wind River Linux
>   >
> 


-- 
# Randy MacLeod
# Wind River Linux

