(function () {
    'use strict';

    console.log('painel-voz.js carregado');

    let vozes = [];

    function carregarVozes() {
        vozes = window.speechSynthesis.getVoices();

        console.log(
            '[painel-voz] Vozes disponíveis:',
            vozes.map(v => `${v.name} (${v.lang})`)
        );
    }

    carregarVozes();

    if (
        typeof window.speechSynthesis !== 'undefined' &&
        window.speechSynthesis.onvoiceschanged !== undefined
    ) {
        window.speechSynthesis.onvoiceschanged = carregarVozes;
    }

    window.PainelVoz = {

        falarChamada(chamada) {
            if (!chamada || !chamada.senha) {
                return;
            }

            // Garante que as vozes já estejam carregadas
            if (!vozes.length) {
                vozes = window.speechSynthesis.getVoices();
            }

            const senha = chamada.senha;
            const local = chamada.local || '';
            const numeroLocal = chamada.numeroLocal || '';

            const texto = `Senha ${senha}, dirigir-se ao ${local} ${numeroLocal}`;

            console.log('[painel-voz] Falando:', {
                senha,
                local,
                numeroLocal
            });

            // Procura EXATAMENTE a Microsoft Daniel
            const vozDaniel = vozes.find(voz =>
                voz.name === 'Microsoft Daniel - Portuguese (Brazil)'
            );

            console.log(
                '[painel-voz] Voz selecionada:',
                vozDaniel
                    ? `${vozDaniel.name} (${vozDaniel.lang})`
                    : 'DANIEL NÃO ENCONTRADO'
            );

            const utterance = new SpeechSynthesisUtterance(texto);

            utterance.lang = 'pt-BR';
            utterance.rate = 0.72;
            utterance.pitch = 1;
            utterance.volume = 1;

            if (vozDaniel) {
                utterance.voice = vozDaniel;
            }

            window.speechSynthesis.cancel();

            setTimeout(() => {
                window.speechSynthesis.speak(utterance);
            }, 100);
        }
    };
})();