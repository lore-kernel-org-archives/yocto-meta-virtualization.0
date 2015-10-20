Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97180E006D5; Tue, 20 Oct 2015 08:09:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.171 listed in list.dnswl.org]
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51192E0048C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Oct 2015 08:09:25 -0700 (PDT)
Received: by yknn9 with SMTP id n9so19423615ykn.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Oct 2015 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LsJ9n2RWwb+pLddrEKCzfgnp8tNBUy+YHld4Pns/Qb4=;
	b=YD3/id/lz1tf/VXOYXdcHFVEG41joBtG2AOZyUHtr1khkWdCKQ5+t/kQUu8M2sTaWI
	flg2xuzHiX/2H+yMasiVhn5e8dXyncTDbxC+o2FZJs4ty24121jp4YMCCSmmDVGovHkR
	An5xna03d/ndeQlqjXBtUTz9SOF0itbHTzeNc9fd3M0wg788POdLE2sx3EUMlKlRI1W9
	yFieuqI6JzTOEePBssig8VOZeFf4WY+410XGIE+XGFXg9nzRWIvLi8OY1NpLWtyK51n6
	6GDVlqmMnvKQ7dWyCUHXdFNGMS5gvshqRH7eMx4vlOrDxuRZfATa1UTi6tkTRuxFIGoO
	/LKw==
MIME-Version: 1.0
X-Received: by 10.129.91.68 with SMTP id p65mr2613135ywb.252.1445353764930;
	Tue, 20 Oct 2015 08:09:24 -0700 (PDT)
Received: by 10.129.153.142 with HTTP; Tue, 20 Oct 2015 08:09:24 -0700 (PDT)
In-Reply-To: <20151020144925.GA23845@iapetus.enea.se>
References: <1445255604-65032-1-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4PwKQdVZk4=ps25scwwk2xbyxY1bo=VJT9GBPFCA+2-Jw@mail.gmail.com>
	<20151020144925.GA23845@iapetus.enea.se>
Date: Tue, 20 Oct 2015 11:09:24 -0400
Message-ID: <CADkTA4Ow+UC0Vvm_KiLRc0LeqPUo-i5oOx8UJjxZYiiYK4fDvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo]][PATCH] python-openstackclient: fix checksums
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
X-List-Received-Date: Tue, 20 Oct 2015 15:09:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 20, 2015 at 10:49 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Tue, Oct 20, 2015 at 10:42:41AM -0400, Bruce Ashfield wrote:
>> On Mon, Oct 19, 2015 at 7:53 AM, Josep Puigdemont
>> <josep.puigdemont@enea.com> wrote:
>> > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
>> > ---
>> >  .../recipes-devtools/python/python-openstackclient_1.0.4.bb           | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
>> > index a585b68..221c817 100644
>> > --- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
>> > +++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
>> > @@ -8,8 +8,8 @@ SRCNAME = "python-openstackclient"
>> >
>> >  SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>> >
>> > -SRC_URI[md5sum] = "595c9be3ae2f967f7dd5f33753137377"
>> > -SRC_URI[sha256sum] = "d39a2e6cf98d409f8545b9d3a207eb8cbf3b2fc5ea17b0f8d9bed52326ca9f49"
>> > +SRC_URI[md5sum] = "3ba35cbfa48b876d198d83e37a794721"
>> > +SRC_URI[sha256sum] = "4ae6d7b35fd1da2a07959fea9639e506871abfb769c62f3692d2f2585605ac85"
>>
>> Where they just wrong for the version before ? Or did something change
>> upstream ? If
>> they re-packed the tgz, we'd like to document that and check what
>> actually changed.
>
> a blunder from my side, sorry. When I updated the recipe in the previous
> commit, I updated the version too (from 1.0.3 to 1.0.4), but I forgot to
> update the hashes. I don't know how it happened, because I do test the
> patches before sending them, but obviously that time I didn't...

No worries. Adding the patch and will push it in the next 5 mins!

Bruce

>
> /Josep
>>
>> Bruce
>>
>> >
>> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
>> >
>> > --
>> > 1.9.1
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

