## Estação Nebula 13 (a Skyrat-tg downstream (which is a /tg/station downstream))

[![aqui tem tretas internas](http://svgur.com/i/_js.svg)](https://www.forthebadge.com) [![pelos melhores](https://svgur.com/i/_ij.svg)](https://www.forthebadge.com) [![huehueheurbrbrb](http://svgur.com/i/_kN.svg)](https://www.forthebadge.com) [![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a) 

Estação Nebula 13 é um servidor de **Space Station 13** *MRP* (we didn't mean to steal Nebula13's name, we didn't know you guys were a thing!) que roda no código do [Skyrat/tg/](https://github.com/Skyrat-SS13/Skyrat-tg), que é uma *downstream* do código do [/tg/station 13](https://github.com/tgstation/tgstation). Fornecemos à nossa comunidade as nossas próprias modificações e conteúdo, que são postos sobre o código original do Skyrat/tg/.

* **Website:** https://www.tgstation13.org
* **Código:** https://github.com/tgstation/tgstation
* **Wiki:** https://tgstation13.org/wiki/Main_Page
* **Codedocs:** https://codedocs.tgstation13.org/
* **Discord do /tg/station:** https://discord.com/invite/hGpZ4Z3
* **Discord de desenvolvimento (*coderbus*):** https://discord.gg/Vh8TJp9
* ~~**IRC:** irc://irc.rizon.net/coderbus~~ (dead)

**Estação Nebula 13**

* **Discord do Estação Nebula 13:** https://discord.gg/bFEHtJ7KAp
* **Código:** https://github.com/Nebula-13/Nebulastation1
* **Leia as regras do servidor:** [Estação Nebula 13 [set de regras]](https://docs.google.com/document/d/1Ece9htZmux2hpXwGB4aA8zGjJFYCJq0cV6T_ov56mq4/edit?usp=sharing)

**ATENÇÃO:** Este é o *repositório* do servidor **Estação Nebula 13**, inicialmente baseado-se no código original do *Skyrat Roleplaying Community*; **Skyrat/tg/**. Este servi8dor contém suas próprias *features*, conteúdo e adições no código. 

**Abaixo encontra-se o guia de como fazer o *download* e hospedar seu próprio servidor.** *P.S: O guia não é de nossa autoria; créditos à equipe do Skyrat*.

## DOWNLOADING
[Downloading](.github/DOWNLOADING.md)

[Running on the server](.github/RUNNING_A_SERVER.md)

[Maps and Away Missions](.github/MAPS_AND_AWAY_MISSIONS.md)

## :exclamation: How to compile :exclamation:

On **2021-01-04** we have changed the way to compile the codebase.

Find `BUILD.bat` here in the root folder of tgstation, and double click it to initiate the build. It consists of multiple steps and might take around 1-5 minutes to compile.

After it finishes, you can then [setup the server](.github/RUNNING_A_SERVER.md) normally by opening `tgstation.dmb` in DreamDaemon.

**Building tgstation in DreamMaker directly is now deprecated and might produce errors**, such as `'tgui.bundle.js': cannot find file`.

**[How to compile in VSCode and other build options](tools/build/README.md).**

## Requirements for contributors
[Guidelines for Contributors](.github/CONTRIBUTING.md)

[/tg/station HACKMD account](https://hackmd.io/@tgstation) - Design documentation here

[Documenting your code](.github/AUTODOC_GUIDE.md)

[Policy configuration system](.github/POLICYCONFIG.md)

[Interested in some starting lore?](https://github.com/tgstation/common_core)

## Current Skyrat Modules
* **IC Spawning**: https://github.com/Skyrat-SS13/Skyrat-tg/pull/104
* **Horrorform**: https://github.com/Skyrat-SS13/Skyrat-tg/pull/241
* **Blueshield**: https://github.com/Skyrat-SS13/Skyrat-tg/pull/127

## LICENSE

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.html).

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See LICENSE and GPLv3.txt for more details.

The TGS DMAPI API is licensed as a subproject under the MIT license.

See the footer of [code/__DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

All assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
