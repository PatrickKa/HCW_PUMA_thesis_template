#import "/Template/template.typ": *
#import "@preview/glossy:0.9.2": init-glossary


#show: init-glossary.with(yaml("Abkuerzungen.yaml"))
#show: template


#title-page(
  thesis-type: [Bachelorarbeit],
  title: [Titel (Deutsch)],
  subtitle: [Untertitel (Deutsch)],
  english-title: [Title (English)],
  english-subtitle: [Subtitle (English)],
  authors: ([Vorname Nachname],),
  degree: [Bachelor of Arts in Business],
  program: [Public Management Bachelor/Master],
  supervisors: (
    [Vorname Nachname (Betreuer\*in 1)],
    [Vorname Nachname (Betreuer\*in 2)],
  ),
  date: [2026],
)


#show: front-matter


*Verwendung von Formatvorlagen*

Für Ihre Arbeit wurde eine Word-Vorlage erstellt, die alle wichtigen
Formatierungen wie z.B. Überschriften, Fließtext, Aufzählungen, Beschriftungen,
etc. enthält. Diese Vorlage gewährleistet eine einheitliche und professionelle
Gestaltung Ihrer Arbeit und erleichtert die Erstellung von automatischen
Verzeichnissen, wie dem Inhalts-, Abbildungs- und Tabellenverzeichnis. Durch die
korrekte Nutzung der vorgegebenen Formatvorlagen und Anleitungen können Sie
diese Verzeichnisse mit wenigen Klicks aktualisieren und Ihre Arbeit effizient
strukturieren.

*Mac*

Falls der Formatvorlagenkatalog nicht sichtbar ist, klicken Sie im Menü
"Formatvorlagen" unten auf "Formatvorlagen verwalten" (je nach Word-Version kann
es auch Optionen heißen). Aktivieren Sie im Dialogfeld die Option
"Formatvorlagen anzeigen", falls diese deaktiviert ist.

*Windows*

Bei Windows ist der Formatvorlagenkatalog unter "Start" in der Menüleiste zu
finden. Alle wichtigen Formatvorlagen finden Sie in der Gruppe "Formatvorlagen",
die sich mit dem kleinen, schwarzen Pfeil auf der rechten Seite erweitern
lassen.

*BITTE LÖSCHEN SIE DIESE SEITE VOR ABGABE IHRER ARBEIT!*


= Vorwort/Danksagung

Ein Vorwort oder eine Danksagung dient dazu, persönliche Worte an Leser\*innen
zu richten. Es bietet die Möglichkeit, die eigene Motivation für die Arbeit zu
schildern und Personen oder Institutionen zu danken, die Unterstützung geleistet
haben, wie Betreuer\*innen, Familienmitgliedern oder anderen Unterstütz\*innen.
Es ist ein freiwilliger, persönlicher Abschnitt und steht außerhalb des
wissenschaftlichen Inhalts.


= Kurzfassung

Die Kurzfassung fasst die wichtigsten Inhalte der Arbeit prägnant zusammen. Sie
enthält das Forschungsthema, die Zielsetzung, die Methode, die Ergebnisse und
die Schlussfolgerungen -- alles in wenigen Sätzen. Sie dient dazu, Leser\*innen
einen Überblick über die Arbeit zu geben, ohne ins Detail zu gehen.


= Abstract

Kurzfassung in englischer Version


#table-of-contents()

#v(35.8pt) // Word separates the note below by an empty line

Das Inhaltsverzeichnis wird mit einem Rechtsklick auf das Verzeichnis, "Felder
aktualisieren" und "Gesamtes Verzeichnis aktualisieren" aktualisiert. Sofern die
Formatvorlagen für die Überschriften richtig verwendet wurden, werden alle
Ebenen automatisch im Verzeichnis aktualisiert.


#list-of-abbreviations()

#v(22.5pt) // Word separates the note below by an empty line

Nur dann verwenden, wenn Sie es für notwendig halten, z.B., wenn Sie mehrere
fachspezifische Abkürzungen im Text verwenden. Das Abkürzungsverzeichnis ist
nicht für gängige Abkürzungen (usw., etc., z.B.) vorgesehen.


= Schlüsselbegriffe

Case Management

EMIT

Empowerment

HPLC


#list-of-figures()

#v(22.5pt) // Word separates the note below by an empty line

Ein Abbildungsverzeichnis wird erst ab zwei Abbildungen verwendet, bei weniger
als zwei Abbildungen ist die Seite zu löschen.

Das Abbildungsverzeichnis wird mit einem Rechtsklick auf das Verzeichnis,
"Felder aktualisieren" und "Gesamtes Verzeichnis aktualisieren" aktualisiert.


#list-of-tables()

#v(22.5pt) // Word separates the note below by an empty line

Ein Tabellenverzeichnis wird erst ab zwei Tabellen verwendet, bei weniger als
zwei Tabellen ist die Seite zu löschen. Das Tabellenverzeichnis kann auch auf
derselben Seite wie das Abbildungsverzeichnis stehen.

Das Tabellenverzeichnis wird mit einem Rechtsklick auf das Verzeichnis, "Felder
aktualisieren" und "Gesamtes Verzeichnis aktualisieren" aktualisiert.


#show: main-matter


= Einleitung

Die Einleitung einer wissenschaftlichen Arbeit führt Leser\*innen in das Thema
ein, erläutert den Kontext und zeigt die Relevanz des Themas auf. Sie benennt
die Problemstellung, formuliert die Forschungsfrage und definiert die Ziele der
Arbeit. Zudem gibt sie einen kurzen Überblick über das methodische Vorgehen und
grenzt den Untersuchungsrahmen ab. Abschließend schafft die Einleitung
Orientierung, indem sie die Bedeutung der Arbeit hervorhebt und einen Ausblick
auf den Aufbau gibt.


= Titel des ersten inhaltlichen Kapitels

Für Fließtext ist die Formatvorlage "Standard" zu verwenden. In dieser Vorlage
wird die Einzugsvariante verwendet und mit Abstand vor dem Absatz in der Größe
von 6 Pkt. kombiniert.

Der Fließtext bildet den Hauptteil der Arbeit und enthält die zusammenhängende
Darstellung der Inhalte. Er besteht aus vollständigen Sätzen und Absätzen, in
denen Argumente entwickelt, Theorien erläutert und Ergebnisse präsentiert
werden. Dabei sollte eine klare, wissenschaftliche Sprache verwendet werden, die
logisch und gut strukturiert ist.

Es sollten keine Leerzeilen nach einzelnen Absätzen eingefügt werden, außer vor
und nach nichttextuellen/außerordentlichen Elementen (Grafiken, Tabellen,
Gleichungen, aber auch langen Zitationen).


== Unterkapitel

Die Grobstrukturierung des Textes auf Unterkapitel und Unter-Unterkapitel sollte
durchdacht sein. Ein paar hilfreiche Regeln:

- Nie zwei Überschriften hintereinander ohne Fließtext
- Maximal 3 Ebenen verwenden:
  - 1\. für Kapiteln (Formatvorlage Ü1)
  - 1.1. für Unterkapiteln (Formatvorlage Ü2)
  - 1.1.1. für Unter-Unterkapitel (Formatvorlage Ü3)

Bullet Points nur dort verwenden, wo es unbedingt nötig ist. In einer
wissenschaftlichen Arbeit wird Fließtext bevorzugt.


=== Unter-Unterkapitel

Einen Abschnitt (Kapitel, Unterkapitel oder Unter-Unterkapitel) einzuführen,
macht nur dann Sinn, wenn die Länge des Textes im Abschnitt die Einführung des
Abschnittes "rechtfertigt" -- ca. ab zwei mittelmäßig langen Absätzen...


=== Unter-Unterkapitel

... oder wenn es mindestens zwei Abschnitte derselben hierarchischen Ebene geben
wird, d.h. im Unterkapitel 2.1. das Unter-Unterkapitel 2.1.1. einzuführen, ist
nur dann erlaubt, wenn es auch ein Unter-Unterkapitel 2.1.2. geben wird (oder
auch mehrere).

*Vierte Ebene.* Falls unbedingt eine vierte Überschriftenebene gebraucht wird,
kann statt einer Überschrift der vierten Ebene (z.B. 1.1.1.1.) die Überschrift
in Fettschrift und mit Satzzeichen am Anfang des Absatzes (ohne Einzug,
Nummerierung oder Leerzeile vor/nach) verwendet werden. Diese kommen im
Inhaltsverzeichnis nicht vor.


= Titel des zweites inhaltlichen Kapitels

Jedes Kapitel mit der Überschrift 1 beginnt auf einer neuen Seite. In der
Formatvorlage ist ein automatischer Seitenumbruch bei der Verwendung von
Überschrift 1 hinterlegt.


== Abbildungen

Für Abbildungen sind Beschriftungen sowie Quellenangaben zu verwenden, falls
diese weiterverwendet wurden. Wenn mehr als zwei Abbildungen in der Arbeit
verwendet werden, ist ein Abbildungsverzeichnis zu führen.

#figure(
  image("Images/Image1.jpeg", width: 60mm),
  caption: [
    Beispielbild 1 \
    Quelle: Hochschule Campus Wien/Schedl
  ],
) <fig-beispielbild-1>


=== Abbildungsbeschriftung

Für die Abbildungsbeschriftung sind folgende Schritte zu beachten:

+ Rechtsklick auf die Abbildung und "Beschriftung einfügen" auswählen
+ Abbildungsbeschriftung eingeben (Achtung: Die fortlaufende Nummerierung darf
  nicht geändert werden. Die Abbildung wird sonst nicht automatisch ins
  Abbildungsverzeichnis übernommen!)
+ Bei Bezeichnung (Windows)/Beschriftung (Mac) "Abbildung" auswählen
+ Abbildungsbeschriftung markieren
+ Formatvorlage "Grafikbeschriftung" auswählen
+ Beschriftung unter der Grafik positionieren, falls sie oberhalb einfügt wird

#figure(
  image("Images/Image2.jpeg", width: 60mm),
  caption: [
    Beispielbild 2 \
    Quelle: Hochschule Campus Wien/Schedl
  ],
) <fig-beispielbild-2>


== Fußnoten

Auch Textkörper mit Fußnoten#footnote[Fußnotentext] sind möglich. Eine Fußnote
ist eine Anmerkung am Ende einer Seite, die zusätzliche Informationen oder
Erläuterungen enthält, ohne den Fließtext zu unterbrechen. Sie ist auch nach dem
Satzzeichen möglich.

Den Fußnotenverweis findet man unter Verweise -- Fußnote
einfügen.#footnote[Fußnotentext]


== Direkte Zitate <sec-direkte-zitate>

Direkte Zitate können unmittelbar in den Fließtext eingebaut werden und werden
mit Anführungszeichen gekennzeichnet. "Although there is abundant evidence that
IL-6 is released during sepsis, the precise role of IL-6 in the pathogenesis of
this condition is still not well established." (Hack 1999, S. 6) Ab einer
gewissen Länge wirken aber sehr lange Zitate im Fließtext störend.

Es gilt eine grobe Regel, dass direkte Zitate, die länger als 3 Zeilen in
Anspruch nehmen würden (oder etwa 40 Wörter), als selbstständiger eingerückter
Absatz (Formatvorlage "Direktes Zitat") angeführt werden, mit Leerzeile vor und
nach dem Zitat. Anführungszeichen sind trotzdem zu setzen.

#quote[
  "Die narrative Gerontologie erweitert die Gerontologie um die postmoderne
  Einsicht, dass alles Wissen metaphorisch, historisch und kontextuell sei, und
  benutzt so das Narrative nicht nur als bloßen Zugang zu subjektiven Daten oder
  Aspekten des Alterns." (Hermann 2007, S. 13)
]


== Gleichungen

Gleichungen sind in den Text zu integrieren, d.~h. Satzzeichen sind entsprechend
zu setzen. Auch Beistriche, wie bei

$
  u(t) = & 1 / (2 pi) integral_(-infinity)^infinity U(j omega)
           upright(e)^(j omega t)
           dif omega,
$

sind bei Gleichungen richtig zu setzen.


== Tabellen

Tabellen helfen, Daten übersichtlich zu präsentieren und komplexe Informationen
klar darzustellen.

#figure(
  table(
    columns: 3,
    table.header([Überschrift], [Überschrift], [Überschrift]),
    [Tabellentext], [Tabellentext], [Tabellentext],
    [Tabellentext], [Tabellentext], [Tabellentext],
    [Tabellentext], [Tabellentext], [Tabellentext],
  ),
  caption: [Beispiel für eine Tabelle mit Spaltenüberschrift],
) <tab-beispieltabelle-1>

#let kopf(inhalt) = table.cell(
  fill: rgb("#4C4C4C"),
  text(fill: white, weight: "bold", inhalt),
)
#let zelle(inhalt) = text(fill: black, weight: "regular", inhalt)

#figure(
  table(
    columns: 3,
    fill: none,
    kopf[Überschrift], zelle[Tabellentext], zelle[Tabellentext],
    kopf[Überschrift], [Tabellentext], [Tabellentext],
    kopf[Überschrift], [Tabellentext], [Tabellentext],
    kopf[Überschrift], [Tabellentext], [Tabellentext],
  ),
  caption: [Beispiel für eine Tabelle mit Zeilenüberschrift],
) <tab-beispieltabelle-2>

#figure(
  table(
    columns: 3,
    fill: none,
    kopf[Überschrift], kopf[Überschrift], kopf[Überschrift],
    kopf[Überschrift], [Tabellentext], [Tabellentext],
    kopf[Überschrift], [Tabellentext], [Tabellentext],
    kopf[Überschrift], [Tabellentext], [Tabellentext],
  ),
  caption: [Beispiel für eine Tabelle mit Zeilen- und Spaltenüberschrift],
) <tab-beispieltabelle-3>


=== Tabellenbeschriftung

Für die Tabellenbeschriftung sind folgende Schritte zu beachten:

+ Gesamte Tabelle markieren
+ "Beschriftung einfügen"
+ Tabellenbeschriftung eingeben (Achtung: Die fortlaufende Nummerierung darf
  nicht geändert werden. Die Tabelle wird sonst nicht automatisch ins
  Tabellenverzeichnis übernommen!)
+ Bei Bezeichnung (Windows)/Beschriftung (Mac) "Tabelle" auswählen
+ Tabellenbeschriftung markieren
+ Formatvorlage "Tabellenbeschriftung" auswählen
+ Beschriftung unter der Tabelle positionieren, falls sie oberhalb einfügt wird


#show: back-matter


= Literaturverzeichnis

Zu beachten sind die PUMA-Zitationsrichtlinien (im HCW-Portal unter
Downloads/Vorlagen zu finden).

Im Literaturverzeichnis sind alle verwendeten Literaturquellen alphabetisch
(nach Nachnamen der Autor\*innen) geordnet anzuführen. Die Quellen sollen nicht
nach Typen (Bücher, Internetquellen, usw.) gegliedert werden. Eine eigene
Sektion im Quellenverzeichnis ist nur für Rechtsquellen (besonders, wenn es sich
um eine rechtsmethodische Arbeit handelt) oder andere besondere Quellen (wie
z.B. Interviews oder Beobachtungsprotokolle) erlaubt.

#bibliography("Literatur.bib", full: true)


= Rechtsquellen

#bibliography(
  "Rechtsquellen.bib",
  style: "/Template/Rechtsquellen.csl",
  full: true,
)


= Interviews

#bibliography("Interviews.bib", style: "/Template/Interviews.csl", full: true)


= Anhang 1

Die Gestaltung der Anhänge ist individuell je nach Anhang. Typischerweise werden
in Anhängen Informationen angeführt, die zu detailliert für die Arbeit sind oder
zu viel Platz verbrauchen würden. Beispiele sind Interviewleitfäden,
Datenmaterial wie z.B. der Datensatz (Tabellen mit Rohdaten oder Statistiken).
Interviewtranskripte werden nur elektronisch eingereicht. Sonst Seite löschen.


= Erklärung zur KI-Nutzung

Fügen Sie hier verpflichtend eine Tabelle im Sinne der "Zitationsrichtlinien des
Studiengangs" ein, oder orientieren Sie sich am Tabellenformat im "Leitfaden für
die Erstellung wissenschaftlicher Arbeiten sowie zur Sicherung
wissenschaftlicher Integrität für Studierende" (VR Lehre und Internationales).
Auch wenn Sie KI nicht genutzt haben, muss dies hier angeführt werden.
