Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1C0FE00CA1; Wed, 31 Aug 2016 17:36:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88A10E00C92
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 17:35:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u810Zr5Q020350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Aug 2016 17:35:53 -0700 (PDT)
Received: from [172.25.59.214] (172.25.59.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 17:35:52 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
	<e3ddf5db-afef-7dde-f8d8-42c6c4958a12@windriver.com>
	<3047881.Lfg8Ytdqov@tal> <5574955.TienvFM2l3@tal>
	<CADkTA4NhdqBgHBaSrGrYV-hKH15P8ro6g74GGu=DrEBcSMQWzw@mail.gmail.com>
	<CADkTA4P1D9_QqsweNfQPFWkKG4E-XwsE-GoQns9=_ipx0SD1eA@mail.gmail.com>
	<CADkTA4OXW0B-mX2nFjOHjZYiz9rao2v=WaEZW8TBWMUCD65u2Q@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <4cd27594-9ac5-2dc9-5c1e-67a8695050fd@windriver.com>
Date: Wed, 31 Aug 2016 19:35:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OXW0B-mX2nFjOHjZYiz9rao2v=WaEZW8TBWMUCD65u2Q@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] docker: update license md5sum
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
X-List-Received-Date: Thu, 01 Sep 2016 00:36:01 -0000
Content-Type: multipart/alternative;
	boundary="------------F1C0962B18C110FA204E2589"

--------------F1C0962B18C110FA204E2589
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2016 04:27 PM, Bruce Ashfield wrote:
>
>
> On Wed, Aug 31, 2016 at 5:17 PM, Bruce Ashfield <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
>
>
>
>     On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
>
>
>
>         On Wed, Aug 31, 2016 at 5:11 PM, Mark Asselstine <mark.asselstine@windriver.com <mailto:mark.asselstine@windriver.com>> wrote:
>
>             On August 31, 2016 17:09:45 Mark Asselstine wrote:
>             > On August 31, 2016 16:56:38 Bruce Ashfield wrote:
>             > > On 2016-08-31 2:19 PM, Mark Asselstine wrote:
>             > > > Seems upstream adjusted their LICENSE file. The license is still
>             > > > Apache version 2 so no worries about having to update the LICENSE
>             > > > string for the recipe.
>             > >
>             > > Or is this using a common LIC file which changed ? My oe-core is
>             > > about two weeks out of date.
>             >
>             > Has nothing to do with the SRC_URI, it is a changed md5sum on the fetched
>             > content, in this case the file named LICENSE.
>
>             OH, I see why you tied it back to the git hash. That just means that this
>             mismatch has existed since that hash was changed. Again, just masked by the
>             manipulation of ERROR_QA.
>
>
>         Nope. Shouldn't be that.
>
>         I just did a cleanall and re-build. The checksum matches.
>
>
>     ... and I just realized that cleanall doesn't get sstate, so I'd better remove that as well!
>
>
> Sure enough, it was sstate that was the difference, skipped tasks on my recent build.
>
> I'm seeing this now.   So I'll apply this as-is.
>
> Shows how many people are tracking meta-virt master :D
>



I hit the problem earlier but then the sstate made it go away, so something screwy is going on there.  A cleanall is supposed to clear the download + the sstate.

Kind of odd.

Jason.

--------------F1C0962B18C110FA204E2589
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/31/2016 04:27 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4OXW0B-mX2nFjOHjZYiz9rao2v=WaEZW8TBWMUCD65u2Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Aug 31, 2016 at 5:17 PM,
            Bruce Ashfield <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:bruce.ashfield@gmail.com" target="_blank">bruce.ashfield@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote">
              <div dir="ltr"><br>
                <div class="gmail_extra"><br>
                  <div class="gmail_quote"><span class="">On Wed, Aug
                      31, 2016 at 5:13 PM, Bruce Ashfield <span
                        dir="ltr">&lt;<a moz-do-not-send="true"
                          href="mailto:bruce.ashfield@gmail.com"
                          target="_blank">bruce.ashfield@gmail.com</a>&gt;</span>
                      wrote:<br>
                      <blockquote class="gmail_quote">
                        <div dir="ltr"><br>
                          <div class="gmail_extra"><br>
                            <div class="gmail_quote"><span>On Wed, Aug
                                31, 2016 at 5:11 PM, Mark Asselstine <span
                                  dir="ltr">&lt;<a
                                    moz-do-not-send="true"
                                    href="mailto:mark.asselstine@windriver.com"
                                    target="_blank">mark.asselstine@windriver.com</a><wbr>&gt;</span>
                                wrote:<br>
                                <blockquote class="gmail_quote"><span>On
                                    August 31, 2016 17:09:45 Mark
                                    Asselstine wrote:<br>
                                    &gt; On August 31, 2016 16:56:38
                                    Bruce Ashfield wrote:<br>
                                    &gt; &gt; On 2016-08-31 2:19 PM,
                                    Mark Asselstine wrote:<br>
                                    &gt; &gt; &gt; Seems upstream
                                    adjusted their LICENSE file. The
                                    license is still<br>
                                    &gt; &gt; &gt; Apache version 2 so
                                    no worries about having to update
                                    the LICENSE<br>
                                    &gt; &gt; &gt; string for the
                                    recipe.<br>
                                    &gt; &gt;<br>
                                    &gt; &gt; Or is this using a common
                                    LIC file which changed ? My oe-core
                                    is<br>
                                    &gt; &gt; about two weeks out of
                                    date.<br>
                                    &gt;<br>
                                    &gt; Has nothing to do with the
                                    SRC_URI, it is a changed md5sum on
                                    the fetched<br>
                                    &gt; content, in this case the file
                                    named LICENSE.<br>
                                    <br>
                                  </span>OH, I see why you tied it back
                                  to the git hash. That just means that
                                  this<br>
                                  mismatch has existed since that hash
                                  was changed. Again, just masked by the<br>
                                  manipulation of ERROR_QA.<br>
                                </blockquote>
                                <div><br>
                                </div>
                              </span>
                              <div>Nope. Shouldn't be that. </div>
                              <div><br>
                              </div>
                              <div>I just did a cleanall and re-build.
                                The checksum matches.</div>
                            </div>
                          </div>
                        </div>
                      </blockquote>
                      <div><br>
                      </div>
                    </span>
                    <div>... and I just realized that cleanall doesn't
                      get sstate, so I'd better remove that as well!</div>
                  </div>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Sure enough, it was sstate that was the difference,
              skipped tasks on my recent build.</div>
            <div><br>
            </div>
            <div>I'm seeing this now.   So I'll apply this as-is.</div>
            <div><br>
            </div>
            <div>Shows how many people are tracking meta-virt master :D</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <br>
    I hit the problem earlier but then the sstate made it go away, so
    something screwy is going on there.  A cleanall is supposed to clear
    the download + the sstate.<br>
    <br>
    Kind of odd.<br>
    <br>
    Jason. <br>
  </body>
</html>

--------------F1C0962B18C110FA204E2589--
